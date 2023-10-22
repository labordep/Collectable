Class {
	#name : #CollectibleVideoGame,
	#superclass : #Collectible,
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveDeveloper + TCollectibleHavePublisher',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveDeveloper classTrait + TCollectibleHavePublisher classTrait',
	#category : #'Collectable-Model'
}

{ #category : #testing }
CollectibleVideoGame >> isVideoGame [

	^ true
]
