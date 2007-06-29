Class {
	#name : #PastellCollection,
	#superclass : #OrderedCollection,
	#category : #'Pastell-Base'
}

{ #category : #accessing }
PastellCollection >> / aSymbol [
	^ self child: aSymbol 
]

{ #category : #accessing }
PastellCollection >> // aSymbol [
	^ self descendant: aSymbol 
]

{ #category : #accessing }
PastellCollection >> child: aSymbol [
	| results |
	results := self species new.
	self do: [:each | results addAll: (each child: aSymbol)].
	^ results
]

{ #category : #accessing }
PastellCollection >> contentString [
	^ self collect: [:each | each contentString]
]

{ #category : #accessing }
PastellCollection >> descendant: aSymbol [
	| results |
	results := self species new.
	self do: [:each | results addAll: (each descendant: aSymbol)].
	^ results
]

{ #category : #'error handling' }
PastellCollection >> doesNotUnderstand: aMessage [
	(self child: aMessage selector)
		ifEmpty: [super doesNotUnderstand: aMessage]
		ifNotEmptyDo: [:value | ^ value]
]