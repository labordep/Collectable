Class {
	#name : #CollectableApp,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableAppType',
	#classTraits : 'CollectableAppType classTrait',
	#instVars : [
		'mainPane',
		'space',
		'collectibleList',
		'searchField',
		'collection'
	],
	#category : #'Collectable-Core'
}

{ #category : #private }
CollectableApp >> buildList [
	| list typeLabel |

	list := ToListElement new nodeFactory: [ :collectible :holder |
		| typePane platformPane contentPane title platform blContent |
		blContent := ToLabeledNode new.
		blContent beHorizontal.
		blContent height: 50; hMatchParent.

		typePane := ToPane new id: #typePanel; beVertical; background: (Color fromHexString: 'D1C4E9'); width: 25; vMatchParent.
		blContent addChild: typePane.

		platformPane := ToPane new id: #platformPanel; beVertical; background: (self getPlatformColor: collectible platform); width: 200; vMatchParent.
		blContent addChild: platformPane.
		
   	 	contentPane := ToPane new id: #contentPane; beVertical; background: (Color fromHexString: 'D1C4E9'); vMatchParent; hMatchParent.
		blContent addChild: contentPane.
		
		typeLabel := ToLabel new id: #typeLabel; text: ((collectible class asString asRopedText) fontSize: 10).
		typeLabel transformDo: [ :t | t normalizedOrigin: 0 @ 1. t rotateBy: 90 ].
		typePane addChild: typeLabel.

		platform := ToLabel new id: #platform;
							text: (collectible platform asUppercase asRopedText foreground: (Color white); fontSize: 20);
			            padding: (BlInsets all: 1);
			            yourself.
		platformPane addChild: platform.

		title := ToLabel new id: #title;
			           text: (collectible title asRopedText foreground: (Color fromHexString: '673AB7'); fontSize: 24; bold);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
		contentPane addChild: title.

		collectible isVideoGame ifTrue:[ | developer publisher |
			developer := ToLabel new id: #developer;
							text: (collectible developer asRopedText foreground: (Color black); fontSize: 10);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
			contentPane addChild: developer.

			publisher := ToLabel new id: #publisher;
							text: (collectible publisher asRopedText foreground: (Color black); fontSize: 10);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
			contentPane addChild: publisher.
		].

		collectible isSystem ifTrue:[
			"todo"
		].

		blContent
	].

	list withRowNumbers.
	^ list
]

{ #category : #private }
CollectableApp >> buildMenu [
	| menu loadCollectionMenu menuBar debugMenu openOnPyramid |

	menuBar := ToMenuBar new hFitContent.

	"File menu"
	menu := ToMenu new.
	menu id: #menu.
	menu layout cellSpacing: 5.
	menu columnWidth: 22.
	menu label: (ToLabel new text: 'File').
	menu icon: (ToImage new innerImage: (self iconNamed: #solidMenu)).
	menuBar addMenu: menu.
	
	"Load menu"
	loadCollectionMenu := ToMenu new.
	loadCollectionMenu label: (ToLabel new text: 'Load collection').
	loadCollectionMenu icon: (ToImage new innerImage: (self iconNamed: #down)).
	menu addItem: loadCollectionMenu.
	loadCollectionMenu addItem: (
		ToMenuItem new 
			label: (ToLabel new text: 'Import GAMEYE.app Spreadsheet'); 
			icon: (ToImage new innerImage: (self iconNamed: #box));
			whenClickedDo:[self importGameyeSpreadsheetCollection]
	).
	
	"Debug menu"
	debugMenu := ToMenu new.
	debugMenu id: #debug.
	debugMenu layout cellSpacing: 5.
	debugMenu columnWidth: 22.
	debugMenu label: (ToLabel new text: 'Debug').
	debugMenu icon: (ToImage new innerImage: (self iconNamed: #repair)).
	menuBar addMenu: debugMenu.
	
	"Open on pyramid button"
	openOnPyramid := ToMenuItem new 
			label: (ToLabel new text: 'Open in Pyramid'); 
			icon: (ToImage new innerImage: (self iconNamed: #edit));
			whenClickedDo:[space editWithPyramid].
	debugMenu addItem: openOnPyramid.
	
	menuBar addFiller.
	
	^ menuBar
]

{ #category : #private }
CollectableApp >> buildSearchWidget [

	| searchPane searchButton |
	
	searchPane := ToPane new beHorizontal; hFitContent.
	
	searchField := ToTextField new hMatchParent; width: 200; placeholderText: 'Search...'.
	searchPane addChild: searchField.
	
	searchButton := ToButton new hMatchParent; width: 50; labelText: 'Search'.
	searchButton whenClickedDo:[ self searchAction ].
	searchPane addChild: searchButton.
	
	^ searchPane
]

{ #category : #releasing }
CollectableApp >> closeSpace [

	space ifNil:[ ^ self ].
	space isOpened ifTrue:[ space close ].
]

{ #category : #'life cycle' }
CollectableApp >> componentActivate [

	self openSpace.
	self openDefaultCollection.
]

{ #category : #'life cycle' }
CollectableApp >> componentInitialize [ 

	self startOSProjectManager.

	self initializeMainPane.
]

{ #category : #'life cycle' }
CollectableApp >> componentPassivate [

	self closeSpace
]

{ #category : #'life cycle' }
CollectableApp >> componentRemove [ 

	self stopOSProjectManager
]

{ #category : #'component accessing' }
CollectableApp >> getCollectOSProjectManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectOSProjectManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectOSProjectManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #private }
CollectableApp >> getPlatformColor: aPlatform [

	aPlatform = 'Nintendo 64' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo GameCube' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Super Nintendo (SNES)' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo (NES)' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Game Boy' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Game Boy Advance' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Game Boy Color' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo DS' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo 3DS' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Pokémon Mini' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Wii' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Wii U' ifTrue:[ ^ Color red whiter whiter whiter ].
	aPlatform = 'Nintendo Switch' ifTrue:[ ^ Color red whiter whiter whiter ].
	
	aPlatform = 'Sega Genesis' ifTrue:[ ^ Color blue whiter whiter ].
	aPlatform = 'Sega Saturn' ifTrue:[ ^ Color blue whiter whiter ].
	aPlatform = 'Sega Dreamcast' ifTrue:[ ^ Color blue whiter whiter ].
	aPlatform = 'Sega Game Gear' ifTrue:[ ^ Color blue whiter whiter ].

	aPlatform = 'Sony PlayStation' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform = 'Sony PlayStation 2' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform = 'Sony PlayStation 3' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform = 'Sony PlayStation 4' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform = 'Sony PlayStation 5' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform = 'Sony PSP' ifTrue:[ ^ Color blue whiter whiter whiter ].
	aPlatform = 'Sony PS Vita' ifTrue:[ ^ Color blue whiter whiter whiter ].
	
	aPlatform = 'Microsoft Xbox' ifTrue:[ ^ Color green whiter whiter whiter ].
	aPlatform = 'Microsoft Xbox 360' ifTrue:[ ^ Color green whiter whiter whiter ].
	aPlatform = 'Microsoft Xbox One' ifTrue:[ ^ Color green whiter whiter whiter ].
	
	aPlatform = 'Neo Geo CD' ifTrue:[ ^ Color yellow whiter whiter whiter ].
	
	aPlatform = 'PC' ifTrue:[ ^ Color darkGray whiter whiter whiter ].
	
	^ Color gray
	
]

{ #category : #actions }
CollectableApp >> importAndBrowseOwnedGameyeSpreadsheetCollections [

	| fileReference collectionList |
	
	fileReference := self getCollectOSProjectManagerServicesProvider openFileReference: 'GAMEYE.app Spreadsheet' onDirectory: FileSystem workingDirectory extensions: #('csv').	
	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ nil ].
	
	collectionList := CollecGameyeUtils importCollectionsFromGameyeSpreadsheetFile: fileReference asFileReference type: GameyeCollection owned.
	collectionList ifEmpty:[ ^ self ].
	
	^ collectionList
]

{ #category : #actions }
CollectableApp >> importGameyeSpreadsheetCollection [

	| collec |
	collec := self importAndBrowseOwnedGameyeSpreadsheetCollections.
	collec ifNil:[ ^ nil ].
	
	"only video games"
	self populateCollectibleListWith: (collec videoGames collectibles).
]

{ #category : #initialization }
CollectableApp >> initializeMainPane [

	| menu title menuPane searchWidget |
	mainPane := ToPane new beVertical.
	mainPane matchParent.
	
	"Menu"
	menuPane := ToPane new beHorizontal; hFitContent.
	mainPane addChild: menuPane.
	
	menu := self buildMenu.
	menuPane addChild: menu.
	searchWidget := self buildSearchWidget.
	menuPane addChild: searchWidget.
	
	"Title"
	title := ToLabel text: ('Collectibles').
	title id: #title.
	mainPane addChild: title.
	
	"List"
	collectibleList := self buildList.
	mainPane addChild: collectibleList
]

{ #category : #actions }
CollectableApp >> openDefaultCollection [

	| collections collectibles |
	collections := CollecWorld defaultCollections.
	collections ifEmpty:[ ^ self ].
	
	collectibles := collections do:[ :c | c collectibles ].
	self populateCollectibleListWith: collectibles.
	
]

{ #category : #initialization }
CollectableApp >> openSpace [	

	space ifNotNil:[ ^ self ].
	space := mainPane openInSpace.
	
	"setup space properties"
	space title: '[|||] Collectable (alpha version)'.
	space position: 100 @ 100.

	"initialize event handlers"
	space when: BlSpaceClosedEvent do:[ self class stop: self componentName ].
	^ space 
]

{ #category : #actions }
CollectableApp >> populateCollectibleListWith: aCollectibleList [
	
	collectibleList data removeAll.
	
	aCollectibleList ifNil:[ ^ self ].
	aCollectibleList ifEmpty: [ ^ self ].
	
	collectibleList data addAll: aCollectibleList.
	
	
]

{ #category : #actions }
CollectableApp >> searchAction [

	"get the content of the field and do the search"
	| searchExpression collectibles |
	collection ifNil:[ ^ self ].
	collection numberOfCollectibles = 0 ifTrue:[ ^ self ].

	searchExpression := (searchField text asString).
	(searchExpression isNil or:[searchExpression isEmpty]) ifTrue:[ self populateCollectibleListWith: collection collectibles ].
	
	collectibles := collection collectibles select:[ :e | 
		(('*', searchExpression, '*') match: e title) or:[
			(('*', searchExpression, '*') match: e platform)
		]
	].
	self populateCollectibleListWith: collectibles.
]

{ #category : #initialization }
CollectableApp >> startOSProjectManager [

	"Start only if this component is the first instance"
	| apps |
	apps := MolUtils allComponentInstancesOfType: CollectableAppType.
	apps size > 1 ifTrue:[ ^ self ].

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager start ].
	^ CollectOSPharoManager start
]

{ #category : #releasing }
CollectableApp >> stopOSProjectManager [
	| apps |
	
	"Stop only if this component is the last instance"
	apps := MolUtils allComponentInstancesOfType: CollectableAppType.
	(apps size = 1 and:[apps first = self]) ifFalse:[ ^ self ].

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager stop ].
	^ CollectOSPharoManager stop
]
