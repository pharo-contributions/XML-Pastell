Class {
	#name : #PSTCollectionTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'Pastell-Tests'
}

{ #category : #'as yet unclassified' }
PSTCollectionTest >> setUp [
	collection := PastellCollection new
]

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testAdd [
	| result |
	result := collection add: 12.
	self assert: collection size = 1.
	self assert: result = 12.
	
]

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testAt [
	collection add: 12.
	self assert: (collection at: 1) = 12.
	
]

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testAtPut [
	collection add: 12.
	collection at: 1 put: 12.
	self assert: (collection at: 1) = 12.
	
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testDNU [
	| xml document html heads |
	xml := '<html><head/><head/></html>'.
	document := XMLDOMParser parseDocumentFrom: xml readStream.
	html := document html.
	heads := html head.
	self assert: heads size = 2.
	self assert: heads first name = #head.
	self assert: heads last name = #head
	
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testDo [
	| results result |
	collection add: 12.
	results := OrderedCollection new.
	result := collection do: [:each | results add: each].
	self assert: results size = 1.
	self assert: results first = 12.
	self assert: result = collection
]

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testNew [
	self shouldnt: [PastellCollection new: 5] raise: Error
]

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testRemove [
	| result |
	collection add: 12.
	result := collection remove: 12 ifAbsent: [].
	self assert: collection size = 0.
	self assert: result = 12.
]

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testRemoveAbsent [
	| result |
	result := collection remove: 12 ifAbsent: [42].
	self assert: result = 42.
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
PSTCollectionTest >> testWithAll [
	| coll |
	coll := OrderedCollection with: 12 with: 13.
	collection := PastellCollection withAll: coll.
	self assert: collection size = 2.
	self deny: collection == coll
]
