Class {
	#name : #CollectibleVideoGame,
	#superclass : #Collectible,
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveDeveloper + TCollectibleHavePublisher + TCollectibleHaveCountry',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveDeveloper classTrait + TCollectibleHavePublisher classTrait + TCollectibleHaveCountry classTrait',
	#category : #'Collectable-Model'
}

{ #category : #testing }
CollectibleVideoGame >> isVideoGame [

	^ true
]
