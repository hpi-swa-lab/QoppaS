definitions
defa1de6821d17744bbadd41140fc207e3f
	<definition>

	^ ((Dictionary new) add: (#block->[:in :out | ([:all | all collect: [:o | (
	[:qoppaReplHistoryItem | {#text -> qoppaReplHistoryItem environment}]
		value: o), { #object -> o }]]
			value: in) do: [:result | out add: result]]); add: (#id->#'a1de6821-d177-44bb-add4-1140fc207e3f'); add: (#class->ViQueryStepDefinition); add: (#properties->((Dictionary new) add: (#creationTimeStamp->'24 November 2015 3:48:52 pm'); add: (#creationAuthor->'bak'); yourself)); add: (#sourceCode->'[:in :out | ([:all | all collect: [:o | (
	[:qoppaReplHistoryItem | {#text -> qoppaReplHistoryItem environment}]
		value: o), { #object -> o }]]
			value: in) do: [:result | out add: result]]'); yourself)