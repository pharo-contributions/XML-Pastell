Extension { #name : #XMLElement }

{ #category : #'*Pastell-accessing' }
XMLElement >> @ aSymbol [
	"shorthand form"
	^ self at: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLElement >> allAttributes [
	^ self attributes asOrderedCollection
]

{ #category : #'*Pastell-accessing' }
XMLElement >> ancestor: aSymbol [
	"climb my parent hierarchy until either I find my ancestor named aSymbol
	or the XMLDocument instance"
	^ (self parent name = aSymbol)
		ifTrue: [ self parent]
		ifFalse: [ self parent ancestor: aSymbol]
]

{ #category : #'*Pastell-accessing' }
XMLElement >> at: aSymbol [
	^ self attributeAt: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLElement >> parent [
	^ parent
]

{ #category : #'*Pastell-accessing' }
XMLElement >> parent: anXMLElement [
	parent := anXMLElement 
]
