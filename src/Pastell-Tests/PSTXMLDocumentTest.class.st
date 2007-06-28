Class {
	#name : #PSTXMLDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Pastell-Tests'
}

{ #category : #'as yet unclassified' }
PSTXMLDocumentTest >> testRoot [
	| xml document |
	xml := '<html/>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	self assert: document root name = #html.
]
