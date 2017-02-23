actions
doDebugAssemblerOfThisBytecode
	"debugs the code that translates the smalltalk bytecode into native machinecode"
	| needle address methodOrDoitString |
	self selectedActivation isActualContextNode ifFalse: [^''].

	needle := self contentLines at: lastClickedContentLineIndex.
	address := (Integer readFrom: needle asString radix: 16). "this is the absolute address"

	methodOrDoitString := self selectedActivation contextPart method.
	[ | optionsDictionaryOrArray stream tuple |
		"find hilPc"
		stream := WriteStream on: (String new: 1000).
		optionsDictionaryOrArray := {
			#ObjectMemory. #Spur32BitCoMemoryManager.
			#debugConcretizationOf. address}.
		tuple := SimpleStackBasedCogit 
			cog: methodOrDoitString
			selectorOrNumCopied: methodOrDoitString selector
			options: optionsDictionaryOrArray.
		tuple second disassembleMethod: tuple last on: stream.
		
		self notify: 'Sorry, I can''find it:', String cr, String cr,
			'I was waiting for ', address, String cr,
			'But it was never written']
	on: WaitAndRaiseFoundIt do: [:e|
		[ | hilPc optionsDictionaryOrArray2 stream2 tuple2 |
		"build high level intermediate language until generating this hilPc"
		hilPc := e needleWritingContext receiver hilPc.
		stream2 := WriteStream on: (String new: 1000).
		optionsDictionaryOrArray2 := {
			#ObjectMemory. #Spur32BitCoMemoryManager.
			#debugHilPc. hilPc}.
		tuple2 := SimpleStackBasedCogit 
			cog: self selectedActivation contextPart method
			selectorOrNumCopied: methodOrDoitString selector
			options: optionsDictionaryOrArray2.
		tuple2 second disassembleMethod: tuple2 last on: stream2.
		
		self notify: 'Sorry, I can''find it:', String cr, String cr,
			'I was waiting for hilPc ', hilPc, String cr,
			'But it was never concretized']
		on: WaitAndRaiseFoundIt do: [:e2|
			"Processor activeProcess debug: e2 needleWritingContext title: 'ho'."
			TBMLD step: e2 needleWritingContext]].