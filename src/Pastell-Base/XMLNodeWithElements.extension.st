Extension { #name : #XMLNodeWithElements }

{ #category : #'*Pastell-Base-accessing' }
XMLNodeWithElements >> / aSymbol [
	"Shorthand form"
	^ self child: aSymbol 
]

{ #category : #'*Pastell-Base-accessing' }
XMLNodeWithElements >> // aSymbol [
	"shorthand form"
	^ self descendant: aSymbol 
]

{ #category : #'*Pastell-Base-accessing' }
XMLNodeWithElements >> child: aSymbol [ 
	| selected |
	"return all my child nodes whose name is aSymbol"
	selected := self elements select: [:each | each name = aSymbol].
	^ PastellCollection withAll: selected
]

{ #category : #'*Pastell-Base-accessing' }
XMLNodeWithElements >> children [
	^ PastellCollection withAll: self elements
]

{ #category : #'*Pastell-Base-accessing' }
XMLNodeWithElements >> descendant: aSymbol [ 
	| selected |
	"return all my descendants (including myself) whose name is aSymbol"
	selected := PastellCollection new.
	self name = aSymbol 
		ifTrue: [selected add: self].
	self elements ifNotEmpty: 
					[selected 
						addAll: ((PastellCollection withAll: self elements) descendant: aSymbol)].
	^ selected
]

{ #category : #'*Pastell-Base-error handing' }
XMLNodeWithElements >> doesNotUnderstand: aMessage [
	"If I have one or more childs whose name is the same as the selector,
	return them in a PastellCollection.
	Otherwise, let the DNU propagate"
	| v |
	v := self child: aMessage selector.
	^ v
		ifEmpty: [ super doesNotUnderstand: aMessage ]
		ifNotEmpty: [ v ].
]
