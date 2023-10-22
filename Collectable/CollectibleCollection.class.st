Class {
	#name : #CollectibleCollection,
	#superclass : #Object,
	#instVars : [
		'name',
		'collectibles'
	],
	#category : #'Collectable-Model'
}

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
