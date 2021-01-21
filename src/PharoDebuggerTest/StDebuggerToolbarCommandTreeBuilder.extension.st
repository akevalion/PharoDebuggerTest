Extension { #name : #StDebuggerToolbarCommandTreeBuilder }

{ #category : #'*PharoDebuggerTest' }
StDebuggerToolbarCommandTreeBuilder >> contextRequestCommandClasses [
	^ {
	StWhereIsCommand.
	MyCustomCommand
	}
]
