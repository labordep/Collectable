Trait {
	#name : #TCollectible,
	#instVars : [
		'dateAdded',
		'name',
		'completion',
		'monetaryValue',
		'pricePaid'
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

{ #category : #'accessing - prices' }
TCollectible >> monetaryValue [

	^ monetaryValue
]

{ #category : #'accessing - prices' }
TCollectible >> monetaryValue: anObject [

	monetaryValue := anObject
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
TCollectible >> pricePaid [

	^ pricePaid
]

{ #category : #accessing }
TCollectible >> pricePaid: anObject [

	pricePaid := anObject
]

{ #category : #printing }
TCollectible >> printIdentifierOn: aStream [

	aStream nextPutAll: self typeString
]

{ #category : #printing }
TCollectible >> printOn: aStream [

	^ self printIdentifierOn: aStream
]

{ #category : #printing }
TCollectible >> typeString [

	^ 'Collectible'
]
