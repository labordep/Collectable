Class {
	#name : #Collectible,
	#superclass : #Object,
	#traits : 'TCollectible',
	#classTraits : 'TCollectible classTrait',
	#category : #'Collectable-Model'
}

{ #category : #testing }
Collectible >> initialize [ 

	super initialize.
	self initializeCompletion.
]

{ #category : #testing }
Collectible >> initializeCompletion [ 

	self completion: CollectibleCompletion new.
]

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

{ #category : #printing }
Collectible >> referenceString [

	^ 'collectible'
]
