Class {
	#name : #PSTCollectionTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Pastell-Tests'
}

{ #category : #running }
PSTCollectionTest >> setUp [
	collection := PastellCollection new
]

{ #category : #testing }
PSTCollectionTest >> testAdd [
	| result |
	result := collection add: 12.
	self assert: collection size = 1.
	self assert: result = 12.
	
]

{ #category : #testing }
PSTCollectionTest >> testAt [
	collection add: 12.
	self assert: (collection at: 1) = 12.
	
]

{ #category : #testing }
PSTCollectionTest >> testAtPut [
	collection add: 12.
	collection at: 1 put: 12.
	self assert: (collection at: 1) = 12.
	
]

{ #category : #testing }
PSTCollectionTest >> testChild [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	html := document child: #html.
	heads := html child: #head.
	self assert: heads size = 2.
	self assert: heads first name = #head.
	self assert: heads last name = #head
	
]

{ #category : #testing }
PSTCollectionTest >> testContentString [
	| xml document text |
	xml := '<html>value<testElement>Test</testElement></html>'.
	document := XMLDOMParser parse: xml readStream.
	text := document html testElement contentString.
	self assert: text first = 'Test'.
	
	self assert: (document html getContentAsString =  'value Test')
]

{ #category : #testing }
PSTCollectionTest >> testDNU [
	| xml document html testElements |
	xml := '<html><testElement/><testElement/></html>'.
	document := XMLDOMParser parse: xml readStream.
	html := document html.
	testElements := html testElement.
	self assert: testElements size = 2.
	self assert: testElements first name = #testElement.
	self assert: testElements last name = #testElement
	
]

{ #category : #testing }
PSTCollectionTest >> testDescendant [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	html := document child: #html.
	heads := html descendant: #head.
	self assert: heads size = 2.
	self assert: heads first name = #head.
	self assert: heads last name = #head
	
]

{ #category : #testing }
PSTCollectionTest >> testDo [
	| results result |
	collection add: 12.
	results := OrderedCollection new.
	result := collection do: [:each | results add: each].
	self assert: results size = 1.
	self assert: results first = 12.
	self assert: result = collection
]

{ #category : #testing }
PSTCollectionTest >> testNew [
	self shouldnt: [PastellCollection new: 5] raise: Error
]

{ #category : #testing }
PSTCollectionTest >> testRemove [
	| result |
	collection add: 12.
	result := collection remove: 12 ifAbsent: [].
	self assert: collection size = 0.
	self assert: result = 12.
]

{ #category : #testing }
PSTCollectionTest >> testRemoveAbsent [
	| result |
	result := collection remove: 12 ifAbsent: [42].
	self assert: result = 42.
]

{ #category : #testing }
PSTCollectionTest >> testSlash [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	html := document / #html.
	heads := html / #head.
	self assert: heads size = 2.
	self assert: heads first name = #head.
	self assert: heads last name = #head
	
]

{ #category : #testing }
PSTCollectionTest >> testSlashSlash [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	html := document / #html.
	heads := html // #head.
	self assert: heads size = 2.
	self assert: heads first name = #head.
	self assert: heads last name = #head
	
]

{ #category : #testing }
PSTCollectionTest >> testSlashSlash2 [
	| xml document |
	xml := '<a><text>hello </text> <text>world</text></a>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	self assert: (document root // #text) getContentAsString = 'hello world'.
	
	xml := '<a><text>hello </text> <a><text>world</text></a></a>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	self assert: (document root // #text) getContentAsString = 'hello world'.
	
	xml := '<a><text>hello </text> <a><text>world</text></a></a>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	self assert: (document root // #a / #text) getContentAsString = 'hello world'
]

{ #category : #testing }
PSTCollectionTest >> testWithAll [
	| coll |
	coll := OrderedCollection with: 12 with: 13.
	collection := PastellCollection withAll: coll.
	self assert: collection size = 2.
	self deny: collection == coll
]
