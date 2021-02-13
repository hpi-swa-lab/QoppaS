scheme-helpers
lastCdr: anObject
	| cons |
	cons := self.
	[cons cdr isNil] whileFalse: [cons := cons cdr].
	cons cdr: anObject.
	^ self