Class {
	#name : #CollectableVideoGamePlatform,
	#superclass : #CollectablePlatform,
	#instVars : [
		'manufacturer',
		'type',
		'generation'
	],
	#category : #'Collectable-VideoGames-Model'
}

{ #category : #'system list' }
CollectableVideoGamePlatform class >> Amiga [
	<script: 'self Amiga inspect'>

	^ self new name: 'Amiga'; manufacturer: 'Commodore'; type: #PC
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> Nintendo64 [
	<script: 'self Nintendo64 inspect'>

	^ self new name: 'Nintendo 64'; manufacturer: 'Nintendo'; generation: 5; type: #HomeConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> NintendoGameBoyColor [
	<script: 'self NintendoGameBoyColor inspect'>

	^ self new name: 'Game Boy Color'; manufacturer: 'Nintendo'; generation: 5; type: #HandheldConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> NintendoNES [
	<script: 'self NintendoNES inspect'>

	^ self new name: 'Nintendo Entertainment System'; manufacturer: 'Nintendo'; generation: 3; type: #HomeConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> NintendoPokemonMini [
	<script: 'self NintendoPokemonMini inspect'>

	^ self new name: 'Pokémon Mini'; manufacturer: 'Nintendo'; generation: 6; type: #HandheldConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> NintendoSNES [
	<script: 'self NintendoSNES inspect'>

	^ self new name: 'Super Nintendo'; manufacturer: 'Nintendo'; generation: 4; type: #HomeConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> NintendoWiiU [
	<script: 'self NintendoWiiU inspect'>

	^ self new name: 'Wii U'; manufacturer: 'Nintendo'; generation: 8; type: #HomeConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> SegaSaturn [
	<script: 'self SegaSaturn inspect'>

	^ self new name: 'Saturn'; manufacturer: 'SEGA'; generation: 5; type: #HomeConsole
]

{ #category : #'system list' }
CollectableVideoGamePlatform class >> unknown [

	^ self new name: 'Unknown'
]

{ #category : #accessing }
CollectableVideoGamePlatform >> generation [

	^ generation
]

{ #category : #accessing }
CollectableVideoGamePlatform >> generation: anObject [

	generation := anObject
]

{ #category : #accessing }
CollectableVideoGamePlatform >> manufacturer [

	^ manufacturer
]

{ #category : #accessing }
CollectableVideoGamePlatform >> manufacturer: anObject [

	manufacturer := anObject
]

{ #category : #accessing }
CollectableVideoGamePlatform >> type [

	^ type
]

{ #category : #accessing }
CollectableVideoGamePlatform >> type: anObject [

	type := anObject
]
