Class {
	#name : #CollectibleVideoGame,
	#superclass : #Collectible,
	#category : #'Collectable-Model'
}

{ #category : #'instance creation' }
CollectibleVideoGame class >> wrapGameyeCollectible: aGameyeCollectible [ 

	^ CollectibleVideoGameGameyeWrapper wrap: aGameyeCollectible
]
