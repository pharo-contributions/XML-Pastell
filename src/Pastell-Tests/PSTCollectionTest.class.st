"
Unit tests for Pastell collections
"
Class {
	#name : #PSTCollectionTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Pastell-Tests-Base'
}

{ #category : #running }
PSTCollectionTest >> setUp [
	super setUp.
	collection := PastellCollection new
]

{ #category : #testing }
PSTCollectionTest >> testAdd [
	| result |
	result := collection add: 12.
	self assert: collection size equals: 1.
	self assert: result equals: 12
]

{ #category : #testing }
PSTCollectionTest >> testAt [
	collection add: 12.
	self assert: (collection at: 1) equals: 12
]

{ #category : #testing }
PSTCollectionTest >> testAtPut [
	collection add: 12.
	collection at: 1 put: 12.
	self assert: (collection at: 1) equals: 12
]

{ #category : #testing }
PSTCollectionTest >> testChild [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parse: xml readStream.
	html := document child: #html.
	heads := html child: #head.
	self assert: heads size equals: 2.
	self assert: heads first name equals: #head.
	self assert: heads last name equals: #head
]

{ #category : #testing }
PSTCollectionTest >> testContentString [
	| xml document text |
	xml := '<html>value<testElement>Test</testElement></html>'.
	document := XMLDOMParser parse: xml readStream.
	text := document html testElement contentString.
	self assert: text first equals: 'Test'.
	self assert: document html getContentAsString equals: 'value Test'
]

{ #category : #testing }
PSTCollectionTest >> testDNU [
	| xml document html testElements |
	xml := '<html><testElement/><testElement/></html>'.
	document := XMLDOMParser parse: xml readStream.
	html := document html.
	testElements := html testElement.
	self assert: testElements size equals: 2.
	self assert: testElements first name equals: #testElement.
	self assert: testElements last name equals: #testElement
]

{ #category : #testing }
PSTCollectionTest >> testDescendant [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parse: xml readStream.
	html := document child: #html.
	heads := html descendant: #head.
	self assert: heads size equals: 2.
	self assert: heads first name equals: #head.
	self assert: heads last name equals: #head
]

{ #category : #testing }
PSTCollectionTest >> testDo [
	| results result |
	collection add: 12.
	results := OrderedCollection new.
	result := collection do: [ :each | results add: each ].
	self assert: results size equals: 1.
	self assert: results first equals: 12.
	self assert: result equals: collection
]

{ #category : #testing }
PSTCollectionTest >> testNew [
	self shouldnt: [PastellCollection new: 5] raise: Error
]

{ #category : #testing }
PSTCollectionTest >> testRemove [
	| result |
	collection add: 12.
	result := collection remove: 12 ifAbsent: [  ].
	self assert: collection size equals: 0.
	self assert: result equals: 12
]

{ #category : #testing }
PSTCollectionTest >> testRemoveAbsent [
	| result |
	result := collection remove: 12 ifAbsent: [ 42 ].
	self assert: result equals: 42
]

{ #category : #testing }
PSTCollectionTest >> testSlash [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parse: xml readStream.
	html := document / #html.
	heads := html / #head.
	self assert: heads size equals: 2.
	self assert: heads first name equals: #head.
	self assert: heads last name equals: #head
]

{ #category : #testing }
PSTCollectionTest >> testSlashSlash [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parse: xml readStream.
	html := document / #html.
	heads := html // #head.
	self assert: heads size equals: 2.
	self assert: heads first name equals: #head.
	self assert: heads last name equals: #head
]

{ #category : #testing }
PSTCollectionTest >> testSlashSlash2 [
	| xml document |
	xml := '<a><text>hello </text> <text>world</text></a>'.
	document := XMLDOMParser parse: xml readStream.
	self
		assert: (document root // #text) getContentAsString
		equals: 'hello world'.
	xml := '<a><text>hello </text> <a><text>world</text></a></a>'.
	document := XMLDOMParser parse: xml readStream.
	self
		assert: (document root // #text) getContentAsString
		equals: 'hello world'.
	xml := '<a><text>hello </text> <a><text>world</text></a></a>'.
	document := XMLDOMParser parse: xml readStream.
	self
		assert: (document root // #a / #text) getContentAsString
		equals: 'hello world'
]

{ #category : #testing }
PSTCollectionTest >> testWithAll [
	| coll |
	coll := OrderedCollection with: 12 with: 13.
	collection := PastellCollection withAll: coll.
	self assert: collection size equals: 2.
	self deny: collection == coll
]
