"
Unit tests for XML elements
"
Class {
	#name : #PSTXMLElementTest,
	#superclass : #TestCase,
	#instVars : [
		'xml',
		'document'
	],
	#category : #'Pastell-Tests-Base'
}

{ #category : #running }
PSTXMLElementTest >> setUp [
	super setUp.
	xml := '<html lang="it" foo="bar">value<head><title/></head><body/></html>'.
	document := XMLDOMParser parse: xml readStream
]

{ #category : #testing }
PSTXMLElementTest >> testAllAttributes [
	self assert: document root attributes size equals: 2
]

{ #category : #testing }
PSTXMLElementTest >> testAt [
	self assert: (document root attributeAt: #lang) equals: 'it'
]

{ #category : #testing }
PSTXMLElementTest >> testCommercialAt [
	self assert: (document root attributeAt: #lang) equals: 'it'
]
