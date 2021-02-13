actions
ListExplicitCdr: aNode parenOpen: x carExpressions: carExpressions dot: d cdrExpression: cdrExpression parenClose: xx
	| list |
	list := QoppaWCons newListFrom: (carExpressions children collect: [:exp | self value: exp]).
	list lastCdr: (self value: cdrExpression).
	^ list
		