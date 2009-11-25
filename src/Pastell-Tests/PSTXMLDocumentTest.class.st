Class {
	#name : #PSTXMLDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'xml',
		'document'
	],
	#category : #'Pastell-Tests'
}

{ #category : #'as yet unclassified' }
PSTXMLDocumentTest >> setUp [
	xml := '<html><head><title/></head><body/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream
]

{ #category : #'as yet unclassified' }
PSTXMLDocumentTest >> testDescendant [
	| results |
	results := document descendant: #title.
	self assert: results size = 1.
	self assert: results first name = #title
	
]

{ #category : #'as yet unclassified' }
PSTXMLDocumentTest >> testRoot [
	self assert: document root name = #html.
]
