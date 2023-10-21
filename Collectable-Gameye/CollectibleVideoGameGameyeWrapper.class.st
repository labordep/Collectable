Class {
	#name : #CollectibleVideoGameGameyeWrapper,
	#superclass : #CollectibleVideoGame,
	#traits : 'TCollectibleGameyeWrapper',
	#classTraits : 'TCollectibleGameyeWrapper classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #accessing }
CollectibleVideoGameGameyeWrapper >> dateAdded [

	^ self gameyeCollectible dateAdded
]
