"
A CollecGameyeUtilsTest is a test class for testing the behavior of CollecGameyeUtils
"
Class {
	#name : #CollecGameyeUtilsTest,
	#superclass : #TestCase,
	#category : #'Collectable-Gameye-Tests-Core'
}

{ #category : #private }
CollecGameyeUtilsTest >> createGameyeCollections [

	| gameyeCollections |
	gameyeCollections := Dictionary new.
	gameyeCollections at: GameyeCollection owned put: GameyeCollection new.
	gameyeCollections at: GameyeCollection forSell put: GameyeCollection new.
	gameyeCollections at: GameyeCollection wish put: GameyeCollection new.
	^ gameyeCollections
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateEmptyPeripheralsCollection [

	| gameyeCollection collection |
	gameyeCollection := GameyeCollection new.
	collection := CollecGameyeUtils createPeripheralsCollection: gameyeCollection.
	
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name equals: 'Video Games Peripherals'.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateEmptySystemsCollection [

	| gameyeCollection collection |
	gameyeCollection := GameyeCollection new.
	collection := CollecGameyeUtils createSystemsCollection: gameyeCollection.
	
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name equals: 'Video Games Systems'.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateEmptyVideoGamesCollection [

	| gameyeCollection collection |
	gameyeCollection := GameyeCollection new.
	collection := CollecGameyeUtils createVideoGamesCollection: gameyeCollection.
	
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name equals: 'Video Games'.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreatePeripheralsCollection [

	| gameyeCollections collection collectible |
	gameyeCollections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (GameyeCollectionFactoryV5Test
		exportedSpreadsheetSampleFileReference: GameyeCollectionFactoryV5Test exportedSpreadsheetSampleContentV5_1ControllerWithTags).
	collection := CollecGameyeUtils createPeripheralsCollection: (gameyeCollections at: GameyeCollection owned).
	
	self assert: collection numberOfCollectibles equals: 1.
	self assert: collection name equals: 'Video Games Peripherals'.
	
	collectible := collection collectibles first.
	self assert: (collectible isKindOf: CollectibleVideoGamePeripheral).
	self assert: collectible class equals: CollectibleGameyePeripheral.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateSystemsCollection [

	| gameyeCollections collection collectible |
	gameyeCollections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (GameyeCollectionFactoryV5Test
		exportedSpreadsheetSampleFileReference: GameyeCollectionFactoryV5Test exportedSpreadsheetSampleContentV5_1System).
	collection := CollecGameyeUtils createSystemsCollection: (gameyeCollections at: GameyeCollection owned).
	
	self assert: collection numberOfCollectibles equals: 1.
	self assert: collection name equals: 'Video Games Systems'.
	
	collectible := collection collectibles first.
	self assert: (collectible isKindOf: CollectibleVideoGameSystem).
	self assert: collectible class equals: CollectibleGameyeSystem.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateVideoGamesCollection [

	| gameyeCollections collection collectible |
	gameyeCollections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (GameyeCollectionFactoryV5Test
		exportedSpreadsheetSampleFileReference: GameyeCollectionFactoryV5Test exportedSpreadsheetSampleContentV5_1VideoGameWitComplexeStringValues).
	collection := CollecGameyeUtils createVideoGamesCollection: (gameyeCollections at: GameyeCollection owned).
	
	self assert: collection numberOfCollectibles equals: 1.
	self assert: collection name equals: 'Video Games'.
	
	collectible := collection collectibles first.
	self assert: (collectible isKindOf: CollectibleVideoGame).
	self assert: collectible class equals: CollectibleGameyeVideoGame.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testImportForSellCollectionsFromGameyeSpreadsheetCollection [

	| collections |
	collections := CollecGameyeUtils importForSellCollectionsFromGameyeSpreadsheetCollection: self createGameyeCollections.
	
	self assert: collections size equals: 3.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testImportOwnedCollectionsFromGameyeSpreadsheetCollection [

	| collections |
	collections := CollecGameyeUtils importOwnedCollectionsFromGameyeSpreadsheetCollection: self createGameyeCollections.
	
	self assert: collections size equals: 3.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testImportWishCollectionsFromGameyeSpreadsheetCollection [

	| collections |
	collections := CollecGameyeUtils importWishCollectionsFromGameyeSpreadsheetCollection: self createGameyeCollections.
	
	self assert: collections size equals: 3.
]
