Extension { #name : #XMLNodeWithElements }

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> / aSymbol [
	"Shorthand form"
	^ self child: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> // aSymbol [
	"shorthand form"
	^ self descendant: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> child: aSymbol [
	| answer |
	
	"return all my child nodes whose name is aSymbol"
	answer := PastellCollection new.
	self tagsNamed: aSymbol do: [:v | answer add: v].
	^ answer
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> children [
	^ PastellCollection withAll: self elements
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> descendant: aSymbol [ 
	| selected |
	"return all my descendants (including myself) whose name is aSymbol"
	selected := PastellCollection new.
	self name = aSymbol 
		ifTrue: [selected add: self]
		ifFalse: 
			[self elements ifNotEmpty: 
					[selected 
						addAll: ((PastellCollection withAll: self elements) descendant: aSymbol)]].
	^ selected
]

{ #category : #'*Pastell-error handing' }
XMLNodeWithElements >> doesNotUnderstand: aMessage [
	"If I have one or more childs whose name is the same as the selector,
	return them in a PastellCollection.
	Otherwise, let the DNU propagate"
	(self child: aMessage selector)
		ifEmpty: [super doesNotUnderstand: aMessage]
		ifNotEmptyDo: [:value | ^ value].
]
