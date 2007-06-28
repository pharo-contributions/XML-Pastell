Extension { #name : #XMLNodeWithElements }

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> / aSymbol [
	^ self child: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> // aSymbol [
	^ self descendant: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> addElement: element [
	element parent: self.
	self elements add: element
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> child: aSymbol [ 
	| selected |
	selected := self elements select: [:each | each name = aSymbol].
	^ PastellCollection withAll: selected
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> children [
	^ PastellCollection withAll: self elements
]

{ #category : #'*Pastell-error handling' }
XMLNodeWithElements >> doesNotUnderstand: aMessage [
	(self child: aMessage selector)
		ifEmpty: [super doesNotUnderstand: aMessage]
		ifNotEmptyDo: [:value | ^ value].
]
