as yet unclassified
testEvaluate
	| repl |
	repl := QoppaRepl new
		evaluate: '(+ 1 2)'.
	self assert: repl history size equals: 1.
	self assert: repl history first result equals: 3