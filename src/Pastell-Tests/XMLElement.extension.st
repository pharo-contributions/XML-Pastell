Extension { #name : #XMLElement }

{ #category : #'*Pastell-accessing' }
XMLElement >> @ aSymbol [
	^ self at: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLElement >> allAttributes [
	^ self attributes asOrderedCollection
]

{ #category : #'*Pastell-accessing' }
XMLElement >> ancestor: aSymbol [
	^ (self parent name = aSymbol)
		ifTrue: [ self parent]
		ifFalse: [ self parent ancestor: aSymbol]
]

{ #category : #'*Pastell-accessing' }
XMLElement >> at: aSymbol [
	^ self attributeAt: aSymbol 
]

{ #category : #'*Pastell-accessing' }
XMLElement >> descendant: aSymbol [
	| selected |
	selected := PSTCollection new.
	(self name = aSymbol)
		ifTrue: [selected add: self]
		ifFalse: [self elements ifNotEmpty: [selected addAll: ((PSTCollection withAll: self elements) descendant: aSymbol)]].
	^ selected
]

{ #category : #'*Pastell-accessing' }
XMLElement >> parent [
	^ parent
]

{ #category : #'*Pastell-accessing' }
XMLElement >> parent: anXMLElement [
	parent := anXMLElement 
]
