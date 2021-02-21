as yet unclassified
resumeWithValue: anObject

	^ self resume: (QoppaWCons withCar: self variableName cdr: (QoppaWCons withCar: anObject cdr: nil))