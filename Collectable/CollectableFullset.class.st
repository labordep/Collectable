Class {
	#name : #CollectableFullset,
	#superclass : #Collectable,
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
CollectableFullset >> addCatalog: aCatalog [

	self catalogs add: aCatalog
]

{ #category : #accessing }
CollectableFullset >> catalogs [

	^ catalogs ifNil:[catalogs := OrderedCollection new].
]

{ #category : #accessing }
CollectableFullset >> catalogs: anObject [

	catalogs := anObject
]

{ #category : #accessing }
CollectableFullset >> collectibleQueryBlock [

	^ collectibleQueryBlock
]

{ #category : #accessing }
CollectableFullset >> collectibleQueryBlock: anObject [

	collectibleQueryBlock := anObject
]

{ #category : #accessing }
CollectableFullset >> collectionFilterBlock [

	^ collectionFilterBlock
]

{ #category : #accessing }
CollectableFullset >> collectionFilterBlock: anObject [

	collectionFilterBlock := anObject
]

{ #category : #querying }
CollectableFullset >> includesCollectible: aCollectible [

	| reference |
	reference := aCollectible referenceString.
	
	(self catalogs anySatisfy:[ :catalog | (catalog includesReference: reference) ]) ifTrue:[ ^ true ].
	
	^ self collectibleQueryBlock ifNotNil: [ :e | e value: aCollectible ] ifNil: [ false ] 
]

{ #category : #accessing }
CollectableFullset >> initialize [ 

	super initialize.
	self collectionFilterBlock: [ :collection | collection asUniqueCollectibles ].
]

{ #category : #accessing }
CollectableFullset >> name [

	^ name ifNil:[ name := 'Unknown Fullset' ].
]

{ #category : #accessing }
CollectableFullset >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CollectableFullset >> numberOfCollectibles [

	self catalogs ifNotEmpty: [ | count |
		count := 0.
		self catalogs do:[ :c | count := count + c numberOfCollectibles ].
		^ count
	] ifEmpty: [ 
		^ numberOfCollectibles ifNil: [ numberOfCollectibles := 0 ]
	] 
]

{ #category : #accessing }
CollectableFullset >> numberOfCollectibles: anInteger [

	numberOfCollectibles := anInteger
]
