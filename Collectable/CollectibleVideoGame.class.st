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

{ #category : #printing }
CollectibleVideoGame >> referenceString [

	| stream |
	stream := ReadWriteStream on: String new.

	self name ifNil: [ ^ super referenceString ] ifNotNil: [ stream nextPutAll: self name asString ].
	stream space.
	self platform ifNil: [ ^ super referenceString ] ifNotNil: [ stream nextPutAll: self platform asString ]. 
	stream space.
	self country ifNil: [ ^ super referenceString ] ifNotNil: [ stream nextPutAll: self country asString ].
	stream space.
	self developer ifNotNil: [ stream nextPutAll: self developer asString ]. 
	stream space.
	self publisher ifNotNil: [ stream nextPutAll: self publisher asString ]. 
	
	^ stream contents
]

{ #category : #accessing }
CollectibleVideoGame >> typeString [

	^ 'Game'
]
