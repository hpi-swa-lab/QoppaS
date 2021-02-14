environments
bindInGlobalEnv: aSymbol value: anOperative

	self globalEnv car
		lastCdr: (QoppaWCons withCar: (QoppaWCons newListFrom: {(QoppaWSymbol for: aSymbol). anOperative}))