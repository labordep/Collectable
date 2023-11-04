Class {
	#name : #CollectibleFullset,
	#superclass : #Object,
	#instVars : [
		'name',
		'catalogs',
		'collectionFilterBlock',
		'numberOfCollectibles',
		'collectibleQueryBlock'
	],
	#category : #'Collectable-Model'
}

{ #category : #catalog }
CollectibleFullset >> addCatalog: aCatalog [

	self catalogs add: aCatalog
]

{ #category : #accessing }
CollectibleFullset >> catalogs [

	^ catalogs ifNil:[catalogs := OrderedCollection new].
]

{ #category : #accessing }
CollectibleFullset >> catalogs: anObject [

	catalogs := anObject
]

{ #category : #accessing }
CollectibleFullset >> collectibleQueryBlock [

	^ collectibleQueryBlock
]

{ #category : #accessing }
CollectibleFullset >> collectibleQueryBlock: anObject [

	collectibleQueryBlock := anObject
]

{ #category : #accessing }
CollectibleFullset >> collectionFilterBlock [

	^ collectionFilterBlock
]

{ #category : #accessing }
CollectibleFullset >> collectionFilterBlock: anObject [

	collectionFilterBlock := anObject
]

{ #category : #querying }
CollectibleFullset >> includesCollectible: aCollectible [

	| reference |
	reference := aCollectible referenceString.
	
	(self catalogs anySatisfy:[ :catalog | (catalog includesReference: reference) ]) ifTrue:[ ^ true ].
	
	^ self collectibleQueryBlock ifNotNil: [ :e | e value: aCollectible ] ifNil: [ false ] 
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
CollectibleFullset >> numberOfCollectibles [

	self catalogs ifNotEmpty: [ | count |
		count := 0.
		self catalogs do:[ :c | count := count + c numberOfCollectibles ].
		^ count
	] ifEmpty: [ 
		^ numberOfCollectibles ifNil: [ numberOfCollectibles := 0 ]
	] 
]

{ #category : #accessing }
CollectibleFullset >> numberOfCollectibles: anInteger [

	numberOfCollectibles := anInteger
]
