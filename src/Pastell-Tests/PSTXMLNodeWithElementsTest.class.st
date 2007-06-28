Class {
	#name : #PSTXMLNodeWithElementsTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Pastell-Tests'
}

{ #category : #'as yet unclassified' }
PSTXMLNodeWithElementsTest >> testChild [
	| xml document results |
	xml := '<html><head/><body/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	results := document child: #html.
	self assert: results isCollection.
	self assert: results size = 1.
	self assert: results first name = #html.
]
