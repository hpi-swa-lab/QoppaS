environments
buildGlobalEnv
	^QoppaWCons withCar: (QoppaWCons newAssociationListFrom: (self wrapKeysIn: {
		#vau -> self vauPrim.
		#+ -> (self wrapPrim: [:args| args inject: 0 into: [:a :b| a + b]] countingArgs: false).
		#-  -> (self wrapPrim: [:args| args size = 1 ifTrue: [args first negated] ifFalse: [args reduce: [:a :b| a - b]]] countingArgs: false).
		#*  -> (self wrapPrim: [:args| args inject: 1 into: [:a :b| a * b]] countingArgs: false).
		#/   -> (self wrapPrim: [:args| args reduce: [:a :b| a / b]] countingArgs: false).
		#quo   -> (self wrapPrim: [:a :b| a \\ b] countingArgs: true).
		#<=  -> (self wrapPrim: [:args| self toQoppaBoolean: (args reduce: [:a :b| a <= b])] countingArgs: false).
		#>  -> (self wrapPrim: [:args| self toQoppaBoolean: (args reduce: [:a :b| a > b])] countingArgs: false).
		#>=  -> (self wrapPrim: [:args| self toQoppaBoolean: (args reduce: [:a :b| a >= b])] countingArgs: false).
		#<  -> (self wrapPrim: [:args| self toQoppaBoolean: (args reduce: [:a :b| a < b])] countingArgs: false).
		#=  -> (self wrapPrim: [:args| self toQoppaBoolean: (args reduce: [:a :b| a = b])] countingArgs: false).
		#'eq?' -> (self wrapPrim: [:args| self toQoppaBoolean: (args reduce: [:a :b| a = b])] countingArgs: false).
		
		#cons -> (self wrapPrim: [:car :cdr| QoppaWCons withCar: car cdr: cdr] countingArgs: true).
		#car -> (self wrapPrim: [:cons| cons car] countingArgs: true).
		#cdr -> (self wrapPrim: [:cons| cons cdr] countingArgs: true).
		#'set-car!' -> (self wrapPrim: [:cons :car| cons car: car; yourself] countingArgs: true).
		#'set-cdr!' -> (self wrapPrim: [:cons :cdr| cons cdr: cdr; yourself] countingArgs: true).
		
		#bool -> self boolPrim.
		#'null?' -> (self wrapPrim: [:arg| self toQoppaBoolean: arg isNil] countingArgs: true).
		#'symbol?' -> (self wrapPrim: [:arg| self toQoppaBoolean: ((arg isString) or: [arg isQoppaWSymbol])] countingArgs: true).
		#'pair?' -> (self wrapPrim: [:arg| self toQoppaBoolean: arg isCons] countingArgs: true).

		#eval -> (self wrapPrim: [:env :exp| self eval: exp in: env] countingArgs: true).
		#lookup -> (self wrapPrim: [:name :env| self lookup: name in: env] countingArgs: true).
		#operate -> (self wrapPrim: [:env :operative :operands| self operate: operative on: operands in: env] countingArgs: true).
		#halt -> self haltPrimitive.
		#load -> self loadPrimitive.
		#error -> (self wrapPrim: [:args| self error: (args joinSeparatedBy: ' ')] countingArgs: false).
		#random -> (self wrapPrim: [:low :high| low + (high - low) atRandom - 1] countingArgs: true).
		#display -> (self wrapPrim: [:operand| Transcript show: operand. operand] countingArgs: true).
		#newline -> (self wrapPrim: [Transcript cr] countingArgs: true).
	})).