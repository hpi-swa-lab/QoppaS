definitions
def1cac56e961d4b047897b9316f5bb35b1
	<definition>

	^ (Dictionary newFrom: {
(#block -> [:in :out | |currentOldGroup|
	in do: [:tuple | [:node :timestamp |
		(timestamp isNil or: [timestamp < (DateAndTime now - (Duration days: 90 seconds: 0))])
			ifTrue: [currentOldGroup ifNil: [currentOldGroup := VirtualContextNode new.
					currentOldGroup summary: 'mature code'.
					out add: currentOldGroup ].
				currentOldGroup addChild: node]
			ifFalse: [currentOldGroup := nil.
				out add: node]] valueWithArguments: tuple]]).
(#class -> ViQueryStepDefinition).
(#id -> #'1cac56e9-61d4-b047-897b-9316f5bb35b1').
(#properties -> (Dictionary newFrom: {
(#creationAuthor -> 'jr').
(#creationTimeStamp -> '13 January 2016 4:52:18 pm')})).
(#sourceCode -> '[:in :out | |currentOldGroup|
	in do: [:tuple | [:node :timestamp |
		(timestamp isNil or: [timestamp < (DateAndTime now - (Duration days: 90 seconds: 0))])
			ifTrue: [currentOldGroup ifNil: [currentOldGroup := VirtualContextNode new.
					currentOldGroup summary: ''mature code''.
					out add: currentOldGroup ].
				currentOldGroup addChild: node]
			ifFalse: [currentOldGroup := nil.
				out add: node]] valueWithArguments: tuple]]')})