Extension { #name : #XMLNodeWithElements }

{ #category : #'*Pastell-accessing' }
XMLNodeWithElements >> child: aSymbol [
	"return a PSTCollection with all the child elements whose name is aSymbol"
	| selected |
	selected := self elements select: [:each | each name = aSymbol].
	^ PSTCollection withAll: selected.
]
