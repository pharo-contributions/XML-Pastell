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

{ #category : #running }
PSTXMLDocumentTest >> setUp [
	xml := '<html><head><title/></head><body/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream
]

{ #category : #testing }
PSTXMLDocumentTest >> testDescendant [
	| results |
	results := document descendant: #title.
	self assert: results size = 1.
	self assert: results first name = #title
	
]

{ #category : #testing }
PSTXMLDocumentTest >> testRoot [
	self assert: document root name = #html.
]
