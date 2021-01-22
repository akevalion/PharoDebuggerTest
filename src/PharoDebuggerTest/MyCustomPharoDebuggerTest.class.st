Class {
	#name : #MyCustomPharoDebuggerTest,
	#superclass : #TestCase,
	#category : #PharoDebuggerTest
}

{ #category : #tests }
MyCustomPharoDebuggerTest >> method: aNumber [

	"original
	aNumber = 5 ifTrue: [ self error: 'Foo Error' ].
	"

	aNumber = 5 ifTrue: [ self error: 'Foo Error' ]
]

{ #category : #tests }
MyCustomPharoDebuggerTest >> testBasic [
	self method: 5.
	
]
