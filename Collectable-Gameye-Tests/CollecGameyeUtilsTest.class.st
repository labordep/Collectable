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
CollecGameyeUtilsTest >> testCreatePeripheralsCollection [

	| gameyeCollection collection |
	gameyeCollection := GameyeCollection new.
	collection := CollecGameyeUtils createPeripheralsCollection: gameyeCollection.
	
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name equals: 'Video Games Peripherals'.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateSystemsCollection [

	| gameyeCollection collection |
	gameyeCollection := GameyeCollection new.
	collection := CollecGameyeUtils createSystemsCollection: gameyeCollection.
	
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name equals: 'Video Games Systems'.
]

{ #category : #tests }
CollecGameyeUtilsTest >> testCreateVideoGamesCollection [

	| gameyeCollection collection |
	gameyeCollection := GameyeCollection new.
	collection := CollecGameyeUtils createVideoGamesCollection: gameyeCollection.
	
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name equals: 'Video Games'.
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
