as yet unclassified
newDictFrom: assocArray
	" returns a list of key-value cons. Example:
	  '((a 1)(b 2))  is built from {a -> 1. b -> 2}"
	^self newListFrom: (assocArray collect: [:assoc|
		QoppaWCons withCar: assoc key cdr: assoc value ])