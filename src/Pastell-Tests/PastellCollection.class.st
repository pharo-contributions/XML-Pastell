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
	| v |
	v := self child: aMessage selector.
	^ v 
		ifEmpty: [ super doesNotUnderstand: aMessage]
		ifNotEmpty: [ v ]
]

{ #category : #accessing }
PastellCollection >> getContentAsString [
	| ans |
	ans := WriteStream on: String new.
	self contentString do: [:el | ans nextPutAll: el].
	^ ans contents
]

{ #category : #accessing }
PastellCollection >> getContentAsStringSeparatedBy: aCharacter [
	^ (self contentString inject: '' into: [:sum :el | sum , el, aCharacter asString]) allButLast.
]
