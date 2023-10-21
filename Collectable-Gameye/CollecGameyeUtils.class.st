Class {
	#name : #CollecGameyeUtils,
	#superclass : #Object,
	#category : #'Collectable-Gameye-Core'
}

{ #category : #'as yet unclassified' }
CollecGameyeUtils class >> createCollection: aGameyeCollection [

	| collection |
	collection := CollectibleVideoGameCollection new.

	collection videoGames collectibles: (aGameyeCollection videoGames collect:[ :e | e asCollectible ]).
	"collection systems collectibles: (aGameyeCollection systems collect:[ :e | e asCollectible ]).
	collection peripherals collectibles: (aGameyeCollection peripherals collect:[ :e | e asCollectible ])."

	^ collection
]
