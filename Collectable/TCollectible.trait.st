Trait {
	#name : #TCollectible,
	#instVars : [
		'dateAdded'
	],
	#category : #'Collectable-Model-Traits'
}

{ #category : #accessing }
TCollectible >> dateAdded [

	^ dateAdded
]

{ #category : #accessing }
TCollectible >> dateAdded: aDate [

	dateAdded := aDate
]

{ #category : #accessing }
TCollectible >> printIdentifierOn: aStream [

	aStream nextPutAll: 'a Collectible'
]

{ #category : #accessing }
TCollectible >> printOn: aStream [

	^ self printIdentifierOn: aStream
]
