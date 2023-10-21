Class {
	#name : #CollectibleCollection,
	#superclass : #Object,
	#instVars : [
		'name',
		'collectibles',
		'collections'
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

{ #category : #accessing }
CollectibleCollection >> collections [

	^ collections ifNil:[collections := Dictionary new]
]

{ #category : #accessing }
CollectibleCollection >> collections: anObject [

	collections := anObject
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
