Class {
	#name : #CollecGameyeUtils,
	#superclass : #Object,
	#category : #'Collectable-Gameye-Core'
}

{ #category : #'create collection' }
CollecGameyeUtils class >> createPeripheralsCollection: aGameyeCollection [

	| collection |
	collection := CollectibleCollection new.
	collection name: 'Video Games Peripherals'.
	collection addCollectibles: (aGameyeCollection peripherals collect:[ :e | e asCollectible ]) asOrderedCollection.
	^ collection
]

{ #category : #'create platform' }
CollecGameyeUtils class >> createPlatform: aGameyeSystem [

	| ptf |
	ptf := aGameyeSystem
		       ifNil: [ CollectibleGameyeSystem unknown ]
		       ifNotNil: [
		       CollectibleGameyeSystem newFromGameyeName: aGameyeSystem ].
	^ ptf
]

{ #category : #'create collection' }
CollecGameyeUtils class >> createSystemsCollection: aGameyeCollection [

	| collection |
	collection := CollectibleCollection new.
	collection name: 'Video Games Systems'.
	collection addCollectibles: (aGameyeCollection systems collect:[ :e | e asCollectible ]) asOrderedCollection.
	^ collection
]

{ #category : #'create collection' }
CollecGameyeUtils class >> createVideoGamesCollection: aGameyeCollection [

	| collection |
	collection := CollectibleCollection new.
	collection name: 'Video Games'.
	collection addCollectibles: (aGameyeCollection videoGames collect:[ :e | e asCollectible ]) asOrderedCollection.
	^ collection
]

{ #category : #importing }
CollecGameyeUtils class >> importCollectionsFromGameyeSpreadsheetCollection: aDictionary type: aGameyeCollectionType [

	| collections ownedCollection |
	collections := OrderedCollection new.
	aDictionary ifNil:[ ^ collections ].

	ownedCollection := aDictionary at: aGameyeCollectionType ifAbsent:[ ^ collections ].
	
	collections add: (self createVideoGamesCollection: ownedCollection).
	collections add: (self createPeripheralsCollection: ownedCollection).
	collections add: (self createSystemsCollection: ownedCollection).
	
	^ collections
]

{ #category : #importing }
CollecGameyeUtils class >> importCollectionsFromGameyeSpreadsheetFile: aFileReference type: aGameyeCollectionType [

	| collec collections |
	collections := OrderedCollection new.
	(aFileReference isNil or:[aFileReference exists not]) ifTrue:[ ^ collections ].
	
	collec := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (aFileReference asFileReference).
	collec ifNil:[ ^ collections ].

	^ self importCollectionsFromGameyeSpreadsheetCollection: collec type: aGameyeCollectionType
]

{ #category : #importing }
CollecGameyeUtils class >> importForSellCollectionsFromGameyeSpreadsheetCollection: aDictionary [

	^ self importCollectionsFromGameyeSpreadsheetCollection: aDictionary type: GameyeCollection forSell
]

{ #category : #importing }
CollecGameyeUtils class >> importOwnedCollectionsFromGameyeSpreadsheetCollection: aDictionary [

	^ self importCollectionsFromGameyeSpreadsheetCollection: aDictionary type: GameyeCollection owned
]

{ #category : #importing }
CollecGameyeUtils class >> importWishCollectionsFromGameyeSpreadsheetCollection: aDictionary [

	^ self importCollectionsFromGameyeSpreadsheetCollection: aDictionary type: GameyeCollection wish
]
