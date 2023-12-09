Class {
	#name : #CollectableVideoGamesCatalogs,
	#superclass : #Object,
	#category : #'Collectable-VideoGames-Utils'
}

{ #category : #Pokemon }
CollectableVideoGamesCatalogs class >> catalog_pokemonMiniGames_PAL [
	<script: 'self catalog_pokemonMiniGames_PAL inspect'>

	| catalog |
	catalog := CollectibleCatalog new.
	catalog name: 'Pokémon mini games'.
	catalog addCollectible: (CollectibleVideoGame n: 'Pokémon Party Mini' pltf: (CollectableVideoGameSystem pokemonMini name) reg: (CollectableTVRegion PAL) dev: 'Denyu-Sha' pub: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame n: 'Pokémon Puzzle Collection' pltf: (CollectableVideoGameSystem pokemonMini name) reg: (CollectableTVRegion PAL) dev: 'Jupiter Corporation' pub: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame n: 'Pokémon Pinball Mini' pltf: (CollectableVideoGameSystem pokemonMini name) reg: (CollectableTVRegion PAL) dev: 'Jupiter Corporation' pub: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame n: 'Pokémon Zany Cards' pltf: (CollectableVideoGameSystem pokemonMini name) reg: (CollectableTVRegion PAL) dev: 'Denyu-Sha' pub: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame n: 'Pokémon Tetris' pltf: (CollectableVideoGameSystem pokemonMini name) reg: (CollectableTVRegion PAL) dev: 'Nintendo' pub: 'Nintendo').
	^ catalog
]
