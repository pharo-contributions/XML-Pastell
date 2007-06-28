Class {
	#name : #PSTXMLNodeWithElementsTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'xml',
		'document'
	],
	#category : #'Pastell-Tests'
}

{ #category : #'as yet unclassified' }
PSTXMLNodeWithElementsTest >> setUp [
	xml := '<html><head><title/></head><body/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream
]

{ #category : #'as yet unclassified' }
PSTXMLNodeWithElementsTest >> testChild [
	| results |
	results := document child: #html.
	self assert: results isCollection.
	self assert: results size = 1.
	self assert: results first name = #html
]

{ #category : #'as yet unclassified' }
PSTXMLNodeWithElementsTest >> testDirectDescendant [
	| results |
	results := document root descendant: #head.
	self assert: results size = 1.
	self assert: results first name = #head
	
]

{ #category : #'as yet unclassified' }
PSTXMLNodeWithElementsTest >> testSelfDescendant [
	| results |
	results := document root descendant: #html.
	self assert: results first name = #html
	
]

{ #category : #'as yet unclassified' }
PSTXMLNodeWithElementsTest >> testUndirectDescendant [
	| results |
	results := document root descendant: #title.
	self assert: results size = 1.
	self assert: results first name = #title
	
]
