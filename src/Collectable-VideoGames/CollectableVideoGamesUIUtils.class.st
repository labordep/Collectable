Class {
	#name : #CollectableVideoGamesUIUtils,
	#superclass : #Object,
	#category : #'Collectable-VideoGames-UI'
}

{ #category : #colors }
CollectableVideoGamesUIUtils class >> getPlatformColor: aPlatform [

	aPlatform name = 'Nintendo 64' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo GameCube' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Super Nintendo (SNES)' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo (NES)' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Game Boy' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Game Boy Advance' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Game Boy Color' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo DS' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo 3DS' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Pokémon Mini' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Wii' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Wii U' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform name = 'Nintendo Switch' ifTrue:[ ^ Color red whiter whiter whiter ].
	
	aPlatform name = 'Sega Genesis' ifTrue:[ ^ Color blue whiter whiter ].
	aPlatform name = 'Sega Saturn' ifTrue:[ ^ Color blue whiter whiter ].
	aPlatform name = 'Sega Dreamcast' ifTrue:[ ^ Color blue whiter whiter ].
	aPlatform name = 'Sega Game Gear' ifTrue:[ ^ Color blue whiter whiter ].

	aPlatform name = 'Sony PlayStation' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform name = 'Sony PlayStation 2' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform name = 'Sony PlayStation 3' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform name = 'Sony PlayStation 4' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform name = 'Sony PlayStation 5' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform name = 'Sony PSP' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform name = 'Sony PS Vita' ifTrue:[ ^ Color blue whiter whiter whiter ].
	
	aPlatform name = 'Microsoft Xbox' ifTrue:[ ^ Color green whiter whiter whiter ].
	aPlatform name = 'Microsoft Xbox 360' ifTrue:[ ^ Color green whiter whiter whiter ].
	aPlatform name = 'Microsoft Xbox One' ifTrue:[ ^ Color green whiter whiter whiter ].
	
	aPlatform name = 'Neo Geo CD' ifTrue:[ ^ Color yellow whiter whiter whiter ].
	
	aPlatform name = 'PC' ifTrue:[ ^ Color darkGray whiter whiter whiter ].
	
	^ Color gray
	
]
