Trait {
	#name : #TCollectible,
	#instVars : [
		'dateAdded',
		'name'
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
TCollectible >> name [

	^ name
]

{ #category : #accessing }
TCollectible >> name: anObject [

	name := anObject
]

{ #category : #accessing }
TCollectible >> printIdentifierOn: aStream [

	aStream nextPutAll: 'a Collectible'
]

{ #category : #accessing }
TCollectible >> printOn: aStream [

	^ self printIdentifierOn: aStream
]
