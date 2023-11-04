Class {
	#name : #CollectibleVideoGame,
	#superclass : #Collectible,
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveDeveloper + TCollectibleHavePublisher + TCollectibleHaveCountry',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveDeveloper classTrait + TCollectibleHavePublisher classTrait + TCollectibleHaveCountry classTrait',
	#category : #'Collectable-Model'
}

{ #category : #testing }
CollectibleVideoGame >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : #testing }
CollectibleVideoGame >> isVideoGame [

	^ true
]

{ #category : #accessing }
CollectibleVideoGame >> typeString [

	^ 'Game'
]
