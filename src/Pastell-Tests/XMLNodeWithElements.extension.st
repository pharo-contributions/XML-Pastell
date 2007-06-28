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
	"return a PSTCollection with all the child elements whose name is aSymbol"
	| selected |
	selected := self elements select: [:each | each name = aSymbol].
	^ PSTCollection withAll: selected.
]

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> children [
	^ PSTCollection withAll: self elements.
]
