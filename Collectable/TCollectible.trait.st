Trait {
	#name : #TCollectible,
	#instVars : [
		'dateAdded'
	],
	#category : #'Collectable-Model'
}

{ #category : #accessing }
TCollectible >> dateAdded [

	^ dateAdded
]

{ #category : #accessing }
TCollectible >> dateAdded: aDate [

	dateAdded := aDate
]
