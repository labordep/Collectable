Class {
	#name : #CollectibleVideoGame,
	#superclass : #Collectible,
	#traits : 'TCollectibleBelongPlatform + TCollectibleHaveDeveloper + TCollectibleHavePublisher + TCollectibleHaveCountry + TCollectibleHaveTVRegion',
	#classTraits : 'TCollectibleBelongPlatform classTrait + TCollectibleHaveDeveloper classTrait + TCollectibleHavePublisher classTrait + TCollectibleHaveCountry classTrait + TCollectibleHaveTVRegion classTrait',
	#category : #'Collectable-VideoGames-Model'
}

{ #category : #constructor }
CollectibleVideoGame class >> n: aName pltf: aPlatform reg: aRegion dev: aDeveloper pub: aPublisher [

	| game |
	game := self new.
	game name: aName; platform: aPlatform; tvRegion: aRegion; developer: aDeveloper; publisher: aPublisher.
	^ game
]

{ #category : #testing }
CollectibleVideoGame >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : #testing }
CollectibleVideoGame >> isVideoGame [

	^ true
]

{ #category : #accessing }
CollectibleVideoGame >> printIdentifierOn: aStream [

	aStream
		nextPutAll: (self name ifNil:[ '?' ]);
		nextPutAll: ' (';
		nextPutAll: (self typeString ifNil:[ '?' ]);
		nextPutAll: ') ';
		nextPutAll: (self platform ifNil:[ '?' ])
]

{ #category : #printing }
CollectibleVideoGame >> referenceString [

	| stream |
	stream := ReadWriteStream on: String new.

	self name ifNil: [ ^ super referenceString ] ifNotNil: [ stream nextPutAll: self name asString asLowercase ].
	stream space.
	self platform ifNil: [ ^ super referenceString ] ifNotNil: [ stream nextPutAll: self platform asString asLowercase ]. 
	stream space.
	"self country ifNotNil: [ stream nextPutAll: self country asString asLowercase ].
	stream space."
	self developer ifNotNil: [ stream nextPutAll: self developer asString asLowercase ]. 
	stream space.
	self publisher ifNotNil: [ stream nextPutAll: self publisher asString asLowercase ]. 
	
	^ stream contents
]

{ #category : #accessing }
CollectibleVideoGame >> typeString [

	^ 'Game'
]
