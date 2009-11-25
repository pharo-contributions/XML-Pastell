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
