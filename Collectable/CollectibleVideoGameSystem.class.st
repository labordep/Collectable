Class {
	#name : #CollectibleVideoGameSystem,
	#superclass : #Collectible,
	#traits : 'TCollectibleHaveCountry',
	#classTraits : 'TCollectibleHaveCountry classTrait',
	#category : #'Collectable-Model'
}

{ #category : #accessing }
CollectibleVideoGameSystem >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : #testing }
CollectibleVideoGameSystem >> isVideoGameSystem [

	^ true
]

{ #category : #testing }
CollectibleVideoGameSystem >> typeString [

	^ 'System'
]
