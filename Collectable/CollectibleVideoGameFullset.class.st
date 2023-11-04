Class {
	#name : #CollectibleVideoGameFullset,
	#superclass : #CollectibleFullset,
	#instVars : [
		'regions',
		'zones'
	],
	#category : #'Collectable-Model'
}

{ #category : #'fullsets - Nintendo' }
CollectibleVideoGameFullset class >> nintendo64_PAL_FRA [
	"Create Nintendo 64 PAL FRA fullset"
	
	| fullset |
	fullset := self new.
	fullset name: 'Nintendo 64 PAL FRA fullset'.
	fullset nbCollectibles: 239.
	fullset regions add: #PAL.
	fullset zones add: #FRA.
	fullset collectionQueryBlock: [ :e | e isVideoGame and:[ e platform = 'Nintendo 64' ] ].
	^ fullset
]

{ #category : #'fullsets - Nintendo' }
CollectibleVideoGameFullset class >> nintendoPokemonMini_PAL_FRA [
	"Create Pokemon Mini FRA fullset"
	
	| fullset |
	fullset := self new.
	fullset name: 'Pokemon mini PAL FRA fullset'.
	fullset nbCollectibles: 5.
	fullset regions add: #PAL.
	fullset zones add: #FRA.
	fullset collectionQueryBlock: [ :e | e isVideoGame and:[ e platform = 'Nintendo Pokémon Mini' ] ].
	^ fullset
]

{ #category : #'fullsets - Nintendo' }
CollectibleVideoGameFullset class >> nintendoWiiU_PAL_FRA [
	"Create Wii U PAL FRA fullset"
	
	| fullset |
	fullset := self new.
	fullset name: 'Wii U PAL FRA fullset'.
	fullset nbCollectibles: 164.
	fullset regions add: #PAL.
	fullset zones add: #FRA.
	fullset collectionQueryBlock: [ :e | e isVideoGame and:[ e platform = 'Nintendo Wii U' ] ].
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
