convenience
parseFile: someCode
	"Return OhmMatchResult for parsing someCode"
	| result |
	result := self grammar match: someCode startingFrom: 'File'.
	result failed ifTrue: [ result failure signal].
	^ result