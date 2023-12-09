Class {
	#name : #CollectibleVideoGameFullset,
	#superclass : #CollectibleFullset,
	#instVars : [
		'regions',
		'zones'
	],
	#category : #'Collectable-VideoGames-Model'
}

{ #category : #'fullsets - Custom themes' }
CollectibleVideoGameFullset class >> allPokemonLicenceGame_PAL_FRA [
	
	| fullset count pokemonMiniFS |
	fullset := self new.
	fullset name: 'All Pokemon licence games - PAL FRA'.
	
	count := 0.
	
	"Main serie"
	"gameboy"
	count := count + 3.
	"gameboy color"
	count := count + 3.
	"gameboy advance"
	count := count + 5.
	"DS"
	count := count + 9.
	"3DS"
	count := count + 8.
	"Switch"
	count := count + 9.
	
	"Spinoff / derivation"
	"gameboy color"
	count := count + 3.
	"nintendo 64"
	count := count + 4.
	"gamecube"
	count := count + 4.
	"gameboy advance"
	count := count + 2.
	"DS"
	count := count + 10.
	"Wii"
	count := count + 3.
	"3DS"
	count := count + 9.
	"Wii U"
	count := count + 1.
	"Switch"
	count := count + 4.
	"pokemon mini"
	pokemonMiniFS := self nintendoPokemonMini_PAL_FRA.
	count := count + pokemonMiniFS numberOfCollectibles.
	
	fullset numberOfCollectibles: count.
	fullset regions add: CollectableTVRegion PAL.
	fullset zones add: #FRA.
	fullset collectibleQueryBlock: [ :e | 
		(pokemonMiniFS includesCollectible: e) or:[
			e isVideoGame and:[ ('*pokémon*' match: (e name asLowercase)) or:[ ('*pokkén*tournament*' match: (e name asLowercase)) or:[ ('*poképark*' match: (e name asLowercase)) or:[('*pokemon*' match: (e name asLowercase))]]]]
		]
	].
	^ fullset
]

{ #category : #'fullsets - Nintendo systems' }
CollectibleVideoGameFullset class >> nintendo64_PAL_FRA [
	"Create Nintendo 64 PAL FRA fullset"
	
	| fullset |
	fullset := self new.
	fullset name: 'Nintendo 64 PAL FRA fullset'.
	fullset numberOfCollectibles: 239.
	fullset regions add: CollectableTVRegion PAL.
	fullset zones add: #FRA.
	fullset collectibleQueryBlock: [ :e | e isVideoGame and:[ e platform = 'Nintendo 64' ] ].
	^ fullset
]

{ #category : #'fullsets - Nintendo systems' }
CollectibleVideoGameFullset class >> nintendoPokemonMini_PAL_FRA [
	"Create Pokemon Mini FRA fullset"
	
	| fullset |
	fullset := self new.
	fullset name: 'Pokemon mini PAL fullset'.
	fullset addCatalog: CollectableVideoGamesCatalogs catalog_pokemonMiniGames_PAL.
	fullset regions add: CollectableTVRegion PAL.
	"fullset collectionQueryBlock: [ :e | e isVideoGame and:[ e platform = 'Nintendo Pokémon Mini' ] ]."
	^ fullset
]

{ #category : #'fullsets - Nintendo systems' }
CollectibleVideoGameFullset class >> nintendoWiiU_PAL_FRA [
	"Create Wii U PAL FRA fullset"
	
	| fullset |
	fullset := self new.
	fullset name: 'Wii U PAL FRA fullset'.
	fullset numberOfCollectibles: 164.
	fullset regions add: CollectableTVRegion PAL.
	fullset zones add: #FRA.
	fullset collectibleQueryBlock: [ :e | e isVideoGame and:[ e platform = 'Nintendo Wii U' ] ].
	^ fullset
]

{ #category : #accessing }
CollectibleVideoGameFullset >> regions [

	^ regions ifNil: [ regions := Set new ]
]

{ #category : #accessing }
CollectibleVideoGameFullset >> regions: anObject [

	regions := anObject
]

{ #category : #accessing }
CollectibleVideoGameFullset >> zones [

	^ zones ifNil: [ zones := Set new ]
]

{ #category : #accessing }
CollectibleVideoGameFullset >> zones: anObject [

	zones := anObject
]
