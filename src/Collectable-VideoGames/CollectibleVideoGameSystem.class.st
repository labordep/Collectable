Class {
	#name : 'CollectibleVideoGameSystem',
	#superclass : 'Collectible',
	#traits : 'TCollectibleHaveCountry + TCollectibleBelongPlatform',
	#classTraits : 'TCollectibleHaveCountry classTrait + TCollectibleBelongPlatform classTrait',
	#category : 'Collectable-VideoGames-Model',
	#package : 'Collectable-VideoGames',
	#tag : 'Model'
}

{ #category : 'accessing' }
CollectibleVideoGameSystem >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : 'testing' }
CollectibleVideoGameSystem >> isVideoGameSystem [

	^ true
]

{ #category : 'printing' }
CollectibleVideoGameSystem >> printIdentifierOn: aStream [

	aStream nextPutAll: (self name ifNil: [ '?' ])
]

{ #category : 'testing' }
CollectibleVideoGameSystem >> typeString [

	^ 'System'
]
