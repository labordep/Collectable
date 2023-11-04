Class {
	#name : #CollectibleCollection,
	#superclass : #Object,
	#instVars : [
		'name',
		'collectibles'
	],
	#category : #'Collectable-Model'
}

{ #category : #converting }
CollectibleCollection >> asUniqueCollectibles [
	"Return the collection as a new collection without duplicated collectibles"
	
	| collection referenceList |
	collection := self class new.
	collection name: ((self name ifNil:['Collection']) asString), ' without duplicated collectibles'.
	
	referenceList := Dictionary new.
	self collectibles do:[ :e | | reference |
		reference := e referenceString.
		
		"Conserve the element with the highest completion"
		(referenceList includesKey: reference) ifFalse:[ 
			referenceList at: reference put: e 
		] ifTrue:[
			((referenceList at: reference) completion accomplishment) < (e completion accomplishment) ifTrue:[referenceList at: reference put: e].
		].
	].
	
	collection collectibles: (referenceList values).
	^ collection
]

{ #category : #accessing }
CollectibleCollection >> collectibles [

	^ collectibles ifNil:[collectibles := OrderedCollection new]
]

{ #category : #accessing }
CollectibleCollection >> collectibles: anObject [

	collectibles := anObject
]

{ #category : #initialization }
CollectibleCollection >> initialize [ 

	super initialize.
	
]

{ #category : #testing }
CollectibleCollection >> isEmpty [

	^ self collectibles isEmpty
]

{ #category : #statistics }
CollectibleCollection >> lessRecentDateAddedCollectible [
	"Return the oldest date added collectible"
	
	^ (self collectibles copy sort: [ :a :b | a dateAdded < b dateAdded ]) 
		ifEmpty: [ nil ] 
		ifNotEmpty: [ :e | e first ] 
]

{ #category : #statistics }
CollectibleCollection >> mostRecentDateAddedCollectible [
	"Return the oldest date added collectible"
	
	^ (self collectibles copy sort: [ :a :b | a dateAdded > b dateAdded ]) 
		ifEmpty: [ nil ] 
		ifNotEmpty: [ :e | e first ] 
]

{ #category : #accessing }
CollectibleCollection >> name [

	^ name
]

{ #category : #accessing }
CollectibleCollection >> name: anObject [

	name := anObject
]

{ #category : #statistics }
CollectibleCollection >> numberOfCollectibles [
	
	^ self collectibles size
]
