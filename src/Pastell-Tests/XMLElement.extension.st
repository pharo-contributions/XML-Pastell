Extension { #name : #XMLElement }

{ #category : #'*Pastell-accessing' }
XMLElement >> descendant: aSymbol [
	| selected |
	selected := PSTCollection new.
	(self name = aSymbol)
		ifTrue: [selected add: self]
		ifFalse: [self elements ifNotEmpty: [selected addAll: ((PSTCollection withAll: self elements) descendant: aSymbol)]].
	^ selected
]
