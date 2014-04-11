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

{ #category : #running }
PSTXMLNodeWithElementsTest >> setUp [
	xml := '<html><head><title/></head><body/></html>'.
	document := XMLDOMParser parse: xml readStream
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testChild [
	| results |
	results := document child: #html.
	self assert: results isCollection.
	self assert: results size = 1.
	self assert: results first name = #html
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testChildren [
	| results |
	results := document root children.
	self assert: results size = 2.
	self assert: results first name = #head.
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testDNU [
	| results |
	results := document html.
	self assert: results isCollection.
	self assert: results size = 1.
	self assert: results first name = #html.
	self should: [document reset] raise: MessageNotUnderstood
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testDirectDescendant [
	| results |
	results := document root descendant: #head.
	self assert: results size = 1.
	self assert: results first name = #head
	
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testSelfDescendant [
	| results |
	results := document root descendant: #html.
	self assert: results first name = #html
	
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testSlash [
	| results |
	results := document / #html.
	self assert: results isCollection.
	self assert: results size = 1.
	self assert: results first name = #html
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testSlashSlash [
	| results |
	results := document // #title.
	self assert: results size = 1.
	self assert: results first name = #title
	
]

{ #category : #testing }
PSTXMLNodeWithElementsTest >> testUndirectDescendant [
	| results |
	results := document root descendant: #title.
	self assert: results size = 1.
	self assert: results first name = #title
	
]
