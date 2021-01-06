actions
doDebugHistoryItem
	(Smalltalk at: #TBMLD) step: ([self readAndEvaluate: lastClickedHistoryItem evaluatedExpression]
		asContext stepIntoMethod: QoppaInterpreter>>#eval:in:)