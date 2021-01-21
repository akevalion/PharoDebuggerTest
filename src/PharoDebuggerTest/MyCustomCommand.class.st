"
A basic custom command
"
Class {
	#name : #MyCustomCommand,
	#superclass : #StDebuggerCommand,
	#category : #PharoDebuggerTest
}

{ #category : #default }
MyCustomCommand class >> defaultDescription [
	^ 'This icon changes the source code of the current method'
]

{ #category : #default }
MyCustomCommand class >> defaultIconName [
	^ #remote
]

{ #category : #default }
MyCustomCommand class >> defaultName [
	<toolbarDebugCommand: 1100>
	^ 'Change to assert?'
]

{ #category : #default }
MyCustomCommand class >> defaultShortcut [
	^ nil
]

{ #category : #testing }
MyCustomCommand >> appliesTo: aDebugger [
	^ true
]

{ #category : #executing }
MyCustomCommand >> changeErrorToAssert [
	| c sourceNodeExecuted parent |
	c := self debugger currentContext.
	sourceNodeExecuted := c sourceNodeExecuted.
	parent := sourceNodeExecuted parent parent parent.

	self debugger code selectionInterval: (parent start to: parent stop)
]

{ #category : #executing }
MyCustomCommand >> execute [

	self isValidErrorChange ifFalse: [ ^ self ].
	self changeErrorToAssert.
	self updateCodePane.
	
]

{ #category : #executing }
MyCustomCommand >> isValidErrorChange [
	| c sourceNodeExecuted parent |
	c := self debugger currentContext.
	c compiledCode isCompiledMethod ifFalse: [^ false ].
	sourceNodeExecuted := c sourceNodeExecuted.
	(sourceNodeExecuted selector = #error:) ifFalse: [ ^ false ].
	parent := sourceNodeExecuted parent parent parent.
	parent isMessage ifFalse: [ ^ false ].
	parent selector = #ifTrue: ifFalse: [ ^ false ].
	^ true
]

{ #category : #executing }
MyCustomCommand >> updateCodePane [
	
]
