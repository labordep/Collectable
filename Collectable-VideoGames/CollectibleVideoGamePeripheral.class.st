Class {
	#name : #CollectibleVideoGamePeripheral,
	#superclass : #Collectible,
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveCountry',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveCountry classTrait',
	#category : #'Collectable-VideoGames-Model'
}

{ #category : #accessing }
CollectibleVideoGamePeripheral >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : #accessing }
CollectibleVideoGamePeripheral >> isVideoGamePeripheral [

	^ true
]

{ #category : #accessing }
CollectibleVideoGamePeripheral >> typeString [

	^ 'Peripheral'
]
