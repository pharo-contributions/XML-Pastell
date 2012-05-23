Class {
	#name : #PSTXMLElementTest,
	#superclass : #TestCase,
	#instVars : [
		'xml',
		'document'
	],
	#category : #'Pastell-Tests'
}

{ #category : #running }
PSTXMLElementTest >> setUp [
	xml := '<html lang="it" foo="bar">value<head><title/></head><body/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream
]

{ #category : #testing }
PSTXMLElementTest >> testAllAttributes [
	self assert: (document root attributes) size = 2
]

{ #category : #testing }
PSTXMLElementTest >> testAt [
	self assert: (document root attributeAt: #lang) = 'it'
]

{ #category : #testing }
PSTXMLElementTest >> testCommercialAt [
	self assert: (document root attributeAt: #lang) = 'it'
]
