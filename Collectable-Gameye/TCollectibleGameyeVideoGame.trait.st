Trait {
	#name : #TCollectibleGameyeVideoGame,
	#traits : 'TCollectibleGameyeCollectible',
	#classTraits : 'TCollectibleGameyeCollectible classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #accessing }
TCollectibleGameyeVideoGame >> developer [

	^ self delegate developer
]

{ #category : #accessing }
TCollectibleGameyeVideoGame >> publisher [

	^ self delegate publisher
]
