Extension { #name : #XMLDocument }

{ #category : #'*Pastell-accessing' }
XMLDocument >> ancestor: aSymbol [
	^ nil
]

{ #category : #'*Pastell-accessing' }
XMLDocument >> descendant: aSymbol [
	^ self root descendant: aSymbol
]

{ #category : #'*Pastell-accessing' }
XMLDocument >> root [
	^ self topElement 
]
