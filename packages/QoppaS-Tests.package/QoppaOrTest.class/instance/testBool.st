tests
testBool
	self assert: false equals: (self readAndEvaluate: '(or #f #f #f)').
	self assert: false equals: (self readAndEvaluate: '(and #t #t #f)').
	self assert: true equals: (self readAndEvaluate: '(or #f #f #t)').
	self assert: true equals: (self readAndEvaluate: '(and #t #t #t)').