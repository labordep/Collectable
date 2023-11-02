Class {
	#name : #CollectibleVideoGamePeripheral,
	#superclass : #Collectible,
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveCountry',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveCountry classTrait',
	#category : #'Collectable-Model'
}

{ #category : #accessing }
CollectibleVideoGamePeripheral >> isVideoGamePeripheral [

	^ true
]
