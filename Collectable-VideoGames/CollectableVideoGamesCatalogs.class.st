Class {
	#name : #CollectableVideoGamesCatalogs,
	#superclass : #Object,
	#category : #'Collectable-VideoGames-Utils'
}

{ #category : #Pokemon }
CollectableVideoGamesCatalogs class >> catalog_pokemonMiniGames_PAL [
	<script: 'self catalog_pokemonMiniGames_PAL inspect'>

	| catalog ptf reg |
	ptf := CollectibleVideoGameSystem NintendoPokemonMini.
	reg := CollectableTVRegion PAL.
	catalog := CollectibleCatalog new.
	catalog name: 'Pokémon mini games'.
	catalog addCollectible: (CollectibleVideoGame new name: 'Pokémon Party Mini'; developer: 'Denyu-Sha'; publisher: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame new name: 'Pokémon Puzzle Collection'; developer: 'Jupiter Corporation'; publisher: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame new name: 'Pokémon Pinball Mini'; developer: 'Jupiter Corporation'; publisher: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame new name: 'Pokémon Zany Cards'; developer: 'Denyu-Sha'; publisher: 'Nintendo').
	catalog addCollectible: (CollectibleVideoGame new name: 'Pokémon Tetris'; developer: 'Nintendo'; publisher: 'Nintendo').
	catalog collectibles do:[ :c | c platform: ptf; tvRegion: reg ].
	^ catalog
]
