Class {
	#name : #PSTXMLElementTest,
	#superclass : #TestCase,
	#instVars : [
		'xml',
		'document'
	],
	#category : #'Pastell-Tests'
}

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> setUp [
	xml := '<html lang="it" foo="bar"><head><title/></head><body/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testAllAttributes [
	self assert: (document root allAttributes) size = 2
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testAt [
	self assert: (document root at: #lang) = 'it'
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testCommercialAt [
	self assert: (document root @ #lang) = 'it'
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testDirectAncestor [
	| result |
	result := (document root descendant: #title) first ancestor: #head.
	self assert: result name = #head
	
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testParent [
	| html head |
	html := document root.
	head := (document descendant: #head) first.
	self assert: head parent = html.
	
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testUndirectAncestor [
	| result |
	result := (document root descendant: #title) first ancestor: #html.
	self assert: result name = #html
	
]

{ #category : #'as yet unclassified' }
PSTXMLElementTest >> testUnexistingAncestor [
	| result |
	result := (document root descendant: #title) first ancestor: #hre.
	self assert: result isNil
	
]
