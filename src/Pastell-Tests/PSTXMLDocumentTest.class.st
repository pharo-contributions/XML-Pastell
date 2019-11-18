"
Unit tests for Pastell XML documents
"
Class {
	#name : #PSTXMLDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'xml',
		'document'
	],
	#category : #'Pastell-Tests-Base'
}

{ #category : #running }
PSTXMLDocumentTest >> setUp [
	super setUp.
	xml := '<html><head><title/></head><body/></html>'.
	document := XMLDOMParser parse: xml readStream
]

{ #category : #testing }
PSTXMLDocumentTest >> testDescendant [
	| results |
	results := document descendant: #title.
	self assert: results size equals: 1.
	self assert: results first name equals: #title
]

{ #category : #testing }
PSTXMLDocumentTest >> testRoot [
	self assert: document root name equals: #html
]
