Class {
	#name : #Collectible,
	#superclass : #Object,
	#traits : 'TCollectible',
	#classTraits : 'TCollectible classTrait',
	#category : #'Collectable-Model'
}

{ #category : #testing }
Collectible >> isVideoGame [

	^ false
]

{ #category : #testing }
Collectible >> isVideoGamePeripheral [

	^ false
]

{ #category : #testing }
Collectible >> isVideoGameSystem [

	^ false
]
