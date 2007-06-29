Extension { #name : #XMLDocument }

{ #category : #'*Pastell-accessing' }
XMLDocument >> ancestor: aSymbol [
	"return nil, since I have neither parent nor ancestors"
	^ nil
]

{ #category : #'*Pastell-accessing' }
XMLDocument >> descendant: aSymbol [
	"send #descendant: to my root.
	See XMLNodeWithElements>>descendant:"
	^ self root descendant: aSymbol
]

{ #category : #'*Pastell-accessing' }
XMLDocument >> root [
	"return my root element, not boxed in a PastellCollection"
	^ self topElement 
]
