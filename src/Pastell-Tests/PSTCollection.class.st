Class {
	#name : #PSTCollection,
	#superclass : #SequenceableCollection,
	#instVars : [
		'collection'
	],
	#category : #'Pastell-Collections'
}

{ #category : #'instance creation' }
PSTCollection class >> withAll: aCollection [
	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #adding }
PSTCollection >> add: anObject [
	^ collection add: anObject
]

{ #category : #accessing }
PSTCollection >> at: index [
	^ collection at: index
]

{ #category : #accessing }
PSTCollection >> child: aSymbol [
	| results |
	results := self species new.
	collection do: [:each | results addAll: (each child: aSymbol)].
	^ results
]

{ #category : #accessing }
PSTCollection >> descendant: aSymbol [
	| results |
	results := self species new.
	collection do: [:each | results addAll: (each descendant: aSymbol)].
	^ results
]

{ #category : #enumerating }
PSTCollection >> do: aBlock [
	collection do: aBlock
]

{ #category : #'initialize-release' }
PSTCollection >> initialize [
	collection := OrderedCollection new
]

{ #category : #removing }
PSTCollection >> remove: oldObject ifAbsent: anExceptionBlock [
	^ collection remove: oldObject ifAbsent: anExceptionBlock
]
