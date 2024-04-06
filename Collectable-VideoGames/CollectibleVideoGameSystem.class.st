Class {
	#name : #CollectibleVideoGameSystem,
	#superclass : #Collectible,
	#traits : 'TCollectibleHaveCountry',
	#classTraits : 'TCollectibleHaveCountry classTrait',
	#instVars : [
		'type',
		'generation',
		'manufacturer'
	],
	#category : #'Collectable-VideoGames-Model'
}

{ #category : #'system list' }
CollectibleVideoGameSystem class >> Amiga [
	<script: 'self Amiga inspect'>

	^ self new name: 'Amiga'; manufacturer: 'Commodore'; type: #PC
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> Nintendo64 [
	<script: 'self Nintendo64 inspect'>

	^ self new name: 'Nintendo 64'; manufacturer: 'Nintendo'; generation: 5; type: #Home
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> NintendoGameBoyColor [
	<script: 'self NintendoGameBoyColor inspect'>

	^ self new name: 'Game Boy Color'; manufacturer: 'Nintendo'; generation: 5; type: #Handheld
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> NintendoNES [
	<script: 'self NintendoNES inspect'>

	^ self new name: 'Nintendo Entertainment System'; manufacturer: 'Nintendo'; generation: 3; type: #Home
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> NintendoPokemonMini [
	<script: 'self NintendoPokemonMini inspect'>

	^ self new name: 'Pokémon Mini'; manufacturer: 'Nintendo'; generation: 6; type: #Handheld
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> NintendoSNES [
	<script: 'self NintendoSNES inspect'>

	^ self new name: 'Super Nintendo'; manufacturer: 'Nintendo'; generation: 4; type: #Home
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> NintendoWiiU [
	<script: 'self NintendoWiiU inspect'>

	^ self new name: 'Wii U'; manufacturer: 'Nintendo'; generation: 8; type: #Home
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> SegaSaturn [
	<script: 'self SegaSaturn inspect'>

	^ self new name: 'Saturn'; manufacturer: 'SEGA'; generation: 5; type: #Home
]

{ #category : #'system list' }
CollectibleVideoGameSystem class >> unknown [

	^ self new name: 'Unknown'
]

{ #category : #accessing }
CollectibleVideoGameSystem >> generation [

	^ generation
]

{ #category : #accessing }
CollectibleVideoGameSystem >> generation: anObject [

	generation := anObject
]

{ #category : #accessing }
CollectibleVideoGameSystem >> initializeCompletion [ 

	self completion: CollectibleVideoGameCompletion new.
]

{ #category : #testing }
CollectibleVideoGameSystem >> isVideoGameSystem [

	^ true
]

{ #category : #accessing }
CollectibleVideoGameSystem >> manufacturer [

	^ manufacturer
]

{ #category : #accessing }
CollectibleVideoGameSystem >> manufacturer: anObject [

	manufacturer := anObject
]

{ #category : #printing }
CollectibleVideoGameSystem >> printIdentifierOn: aStream [

	aStream
		nextPutAll: (self name ifNil:[ '?' ])
]

{ #category : #accessing }
CollectibleVideoGameSystem >> type [

	^ type
]

{ #category : #accessing }
CollectibleVideoGameSystem >> type: anObject [

	type := anObject
]

{ #category : #testing }
CollectibleVideoGameSystem >> typeString [

	^ 'System'
]
