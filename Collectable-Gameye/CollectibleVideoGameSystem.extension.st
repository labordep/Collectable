Extension { #name : #CollectibleVideoGameSystem }

{ #category : #'*Collectable-Gameye' }
CollectibleVideoGameSystem class >> newFromGameyeName: aString [

	"Nintendo"
	aString = 'Nintendo Game Boy Color' ifTrue:[ ^ self NintendoGameBoyColor ].
	aString = 'Nintendo Pokémon Mini' ifTrue:[ ^ self NintendoPokemonMini ].
	
	aString = 'Nintendo (NES)' ifTrue:[ ^ self NintendoNES ].
	aString = 'Super Nintendo (SNES)' ifTrue:[ ^ self NintendoSNES ].
	aString = 'Nintendo 64' ifTrue:[ ^ self Nintendo64 ].
	aString = 'Nintendo Wii U' ifTrue:[ ^ self NintendoWiiU ].
	
	"SEGA"
	aString = 'Sega Saturn' ifTrue:[ ^ self SegaSaturn ].
	
	"Others"
	aString = 'Amiga' ifTrue:[ ^ self Amiga ].
	
	^ self new name: aString
]
