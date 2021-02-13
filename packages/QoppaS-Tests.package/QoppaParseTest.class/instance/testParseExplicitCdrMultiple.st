as yet unclassified
testParseExplicitCdrMultiple
	self flag: #split.
	self assert: (QoppaWCons withCar: 1 cdr: (QoppaWCons withCar: 2 cdr: 3)) equals: (self readAndEvaluate: '''(1 2 . 3)').