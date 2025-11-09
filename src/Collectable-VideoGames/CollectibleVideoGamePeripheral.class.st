Class {
	#name : 'CollectibleVideoGamePeripheral',
	#superclass : 'Collectible',
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveCountry',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveCountry classTrait',
	#category : 'Collectable-VideoGames-Model',
	#package : 'Collectable-VideoGames',
	#tag : 'Model'
}

{ #category : 'accessing' }
CollectibleVideoGamePeripheral >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : 'accessing' }
CollectibleVideoGamePeripheral >> isVideoGamePeripheral [

	^ true
]

{ #category : 'printing' }
CollectibleVideoGamePeripheral >> printIdentifierOn: aStream [

	aStream nextPutAll: (self name ifNil: [ '?' ])
]

{ #category : 'accessing' }
CollectibleVideoGamePeripheral >> typeString [

	^ 'Peripheral'
]
