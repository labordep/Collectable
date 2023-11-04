Class {
	#name : #CollectibleFullset,
	#superclass : #Object,
	#instVars : [
		'nbCollectibles',
		'name',
		'collectionQueryBlock',
		'collectionFilterBlock'
	],
	#category : #'Collectable-Model'
}

{ #category : #accessing }
CollectibleFullset >> collectionFilterBlock [

	^ collectionFilterBlock
]

{ #category : #accessing }
CollectibleFullset >> collectionFilterBlock: anObject [

	collectionFilterBlock := anObject
]

{ #category : #accessing }
CollectibleFullset >> collectionQueryBlock [

	^ collectionQueryBlock
]

{ #category : #accessing }
CollectibleFullset >> collectionQueryBlock: anObject [

	collectionQueryBlock := anObject
]

{ #category : #accessing }
CollectibleFullset >> initialize [ 

	super initialize.
	self collectionFilterBlock: [ :collection | collection asUniqueCollectibles ].
]

{ #category : #accessing }
CollectibleFullset >> name [

	^ name ifNil:[ name := 'Unknown Fullset' ].
]

{ #category : #accessing }
CollectibleFullset >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CollectibleFullset >> nbCollectibles: anInteger [

	nbCollectibles := anInteger
]

{ #category : #accessing }
CollectibleFullset >> nbOfCollectibles [

	^ nbCollectibles ifNil: [ nbCollectibles := 0 ]
]
