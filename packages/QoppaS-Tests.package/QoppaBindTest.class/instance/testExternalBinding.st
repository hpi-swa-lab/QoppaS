as yet unclassified
testExternalBinding
	self assert: 2 equals: ([self readAndEvaluate: 'a'] on: QoppaUnboundVariableFailure do: [:e | e resumeWithValue: 2])