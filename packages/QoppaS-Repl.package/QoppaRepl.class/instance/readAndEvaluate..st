as yet unclassified
readAndEvaluate: anExpressionString
	| item eval |
	item := QoppaReplHistoryItem new.
	item evaluatedExpression: anExpressionString.
	item parsedExpression: (QoppaGrammar OhmInstance match: anExpressionString startingFrom: #File).
	item environment: (interpreter globalEnv shallowCopy).
	
	eval := [interpreter readAndEvaluate: anExpressionString asString].
	item result: (Smalltalk at: #TBMLD ifPresent: [:tbmld | tbmld runDebugged: eval] ifAbsent: eval).
	
	history add: item.
	
	input := ''.
	self changed: #input.
	self changed: #history.