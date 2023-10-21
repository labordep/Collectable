Trait {
	#name : #TCollectibleGameyeWrapper,
	#instVars : [
		'gameyeCollectible'
	],
	#category : #'Collectable-Gameye-Core'
}

{ #category : #creating }
TCollectibleGameyeWrapper classSide >> wrap: aGameyeCollectible [

	^ self new gameyeCollectible: aGameyeCollectible 
]

{ #category : #accessing }
TCollectibleGameyeWrapper >> gameyeCollectible [

	^ gameyeCollectible
]

{ #category : #accessing }
TCollectibleGameyeWrapper >> gameyeCollectible: aGameyeCollectible [

	gameyeCollectible := aGameyeCollectible
]
