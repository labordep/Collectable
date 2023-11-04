Trait {
	#name : #TCollectible,
	#instVars : [
		'dateAdded',
		'name',
		'completion'
	],
	#category : #'Collectable-Model-Traits-Collectible'
}

{ #category : #accessing }
TCollectible >> completion [

	^ completion
]

{ #category : #accessing }
TCollectible >> completion: anObject [

	completion := anObject
]

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

	aStream nextPutAll: self typeString
]

{ #category : #accessing }
TCollectible >> printOn: aStream [

	^ self printIdentifierOn: aStream
]

{ #category : #printing }
TCollectible >> typeString [

	^ 'Collectible'
]
