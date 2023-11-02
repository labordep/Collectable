Class {
	#name : #CollectableApp,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableAppType + CollectableCollectionsManagerEvents',
	#classTraits : 'CollectableAppType classTrait + CollectableCollectionsManagerEvents classTrait',
	#instVars : [
		'mainPane',
		'space',
		'collectibleList',
		'searchField'
	],
	#category : #'Collectable-Core'
}

{ #category : #private }
CollectableApp >> buildList [
	| list |

	list := ToListElement new nodeBuilder: [ :node :holder |
		self buildListNode: node holder: holder.
	].

	list withRowNumbers.
	^ list
]

{ #category : #private }
CollectableApp >> buildListNode: node holder: holder [
		| collectible typePane typeLabel platformPane contentPane title country platform |

		collectible := holder data.
		node layout: BlFlowLayout horizontal.
		node height: 50; hMatchParent.

		typePane := ToPane new id: #typePanel; beVertical; background: (Color fromHexString: 'D1C4E9C8'); width: 25; vMatchParent.
		node addChild: typePane.

		platformPane := ToPane new id: #platformPanel; beVertical; background: ((self getPlatformColor: collectible platform) alpha: 0.75); width: 200; vMatchParent.
		node addChild: platformPane.
		
		title := ToLabel new id: #title;
			           text: (collectible name asRopedText foreground: (Color fromHexString: '673AB7'); fontSize: 24; bold);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
		node addChild: title.
		
   	 	contentPane := ToPane new id: #contentPane; beVertical; background: (Color fromHexString: 'D1C4E9C8'); vMatchParent; hFitContent.
		node addChild: contentPane.
		
		typeLabel := ToLabel new id: #typeLabel; text: ((collectible class asString asRopedText) fontSize: 10).
		typeLabel transformDo: [ :t | t normalizedOrigin: 0 @ 1. t rotateBy: 90 ].
		typePane addChild: typeLabel.

		platform := ToLabel new id: #platform;
							text: (collectible platform asUppercase asRopedText foreground: (Color white); fontSize: 20);
			            padding: (BlInsets all: 1);
			            yourself.
		platformPane addChild: platform.

		country := ToLabel new id: #country;
							text: (collectible country asRopedText foreground: (Color black); fontSize: 10);
		           	 	margin: (BlInsets all: 1);
		           	 	padding: (BlInsets all: 1);
		            		yourself.
		contentPane addChild: country.

		collectible isVideoGame ifTrue:[ | developer publisher |
			
			developer := ToLabel new id: #developer;
							text: (collectible developer asRopedText foreground: (Color black); fontSize: 10);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
			contentPane addChild: developer.
	
			collectible developer ~= collectible publisher ifTrue:[
				publisher := ToLabel new id: #publisher;
							text: (collectible publisher asRopedText foreground: (Color black); fontSize: 10);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
				contentPane addChild: publisher.
			].
		].

		collectible isVideoGameSystem ifTrue:[
			"todo"
		].
]

{ #category : #private }
CollectableApp >> buildMenu [
	| menu loadCollectionMenu menuBar debugMenu openOnPyramid queryMenu searchNoCountryCollectibles |

	menuBar := ToMenuBar new hFitContent.

	"File menu"
	menu := ToMenu new.
	menu id: #menu.
	menu layout cellSpacing: 5.
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
	
	"Query menu"
	queryMenu := ToMenu new.
	queryMenu id: #query.
	queryMenu layout cellSpacing: 5.
	queryMenu label: (ToLabel new text: 'Query').
	queryMenu icon: (ToImage new innerImage: (self iconNamed: #question)).
	menuBar addMenu: queryMenu.
	
	"Query buttons"
	searchNoCountryCollectibles := ToMenuItem new 
			label: (ToLabel new text: 'Without country'); 
			whenClickedDo:[self searchNoCountryAction].
	queryMenu addItem: searchNoCountryCollectibles.
	
	"Debug menu"
	debugMenu := ToMenu new.
	debugMenu id: #debug.
	debugMenu layout cellSpacing: 5.
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

{ #category : #events }
CollectableApp >> collectionsHasChanged: aCollectionList [

	| collectibles |
	collectibles := OrderedCollection new.
	aCollectionList do:[ :c | collectibles addAll: c collectibles ].
	self populateCollectibleListWith: collectibles.
]

{ #category : #'life cycle' }
CollectableApp >> componentActivate [

	self getCollectableCollectionsManagerEventsSubscriber subscribe: self.
 
	self openSpace.
	self openDefaultCollections.
]

{ #category : #'life cycle' }
CollectableApp >> componentInitialize [ 

	self startOSProjectManager.
	self startCollectionsManager.

	self forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	self forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 

	self initializeMainPane.
]

{ #category : #'life cycle' }
CollectableApp >> componentPassivate [
	
	self getCollectableCollectionsManagerEventsSubscriber unsubscribe: self.

	self closeSpace.
	
]

{ #category : #'life cycle' }
CollectableApp >> componentRemove [ 

	self stopCollectionsManager.
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

{ #category : #'component accessing' }
CollectableApp >> getCollectableCollectionsManagerEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := CollectableCollectionsManagerEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: CollectableCollectionsManagerEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #'component accessing' }
CollectableApp >> getCollectableCollectionsManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectableCollectionsManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectableCollectionsManagerServices named: servicesSymbol.
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
	
	self getCollectableCollectionsManagerServicesProvider setCollections: collec
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
CollectableApp >> openDefaultCollections [

	self getCollectableCollectionsManagerServicesProvider setCollections: CollecWorld defaultCollections.	
]

{ #category : #initialization }
CollectableApp >> openSpace [	

	space ifNotNil:[ ^ self ].
	space := mainPane openInSpace.
	
	"setup space properties"
	self updateTitle.
	space position: 100 @ 100.

	"initialize event handlers"
	space when: BlSpaceClosedEvent do:[ :e | self receiveBlSpaceClosedEvent: e ].
	^ space 
]

{ #category : #actions }
CollectableApp >> populateCollectibleListWith: aCollectibleList [
	
	collectibleList data removeAll.
	self updateTitle.
	
	aCollectibleList ifNil:[ ^ self ].
	aCollectibleList ifEmpty: [ ^ self ].
	
	collectibleList data addAll: aCollectibleList.
	self updateTitle.	
	
]

{ #category : #events }
CollectableApp >> receiveBlSpaceClosedEvent: anEvent [ 

	"The closed event can be send after that the component is stop, because it can be have a ghost window, we need to cheeck if the component is really stopped or not"
	
	(MolUtils isInstanciateComponentOf: self class named: self componentName) ifTrue:[
		self class stop: self componentName
	].
]

{ #category : #actions }
CollectableApp >> searchAction [

	| searchExpression |
	searchExpression := (searchField text asString).
	(searchExpression isNil or:[searchExpression isEmpty]) ifTrue:[ self searchAction: nil ].

	self searchAction: [ :e | 
		(('*', searchExpression, '*') match: e name) or:[
			(('*', searchExpression, '*') match: e platform)
		]
	].
]

{ #category : #actions }
CollectableApp >> searchAction: aSelectBlockClosure [

	"get the content of the field and do the search"
	| collectibles collections |
	collections := self getCollectableCollectionsManagerServicesProvider getCollections.
	collectibles := OrderedCollection new.
	collections do:[ :c | collectibles addAll: c collectibles ].
	
	collectibles size = 0 ifTrue:[ ^ self ].

	aSelectBlockClosure ifNil:[ self populateCollectibleListWith: collectibles ].
	
	collectibles := collectibles select: aSelectBlockClosure.
	self populateCollectibleListWith: collectibles.
]

{ #category : #actions }
CollectableApp >> searchNoCountryAction [

	self searchAction: [ :e | e country isNil ]
]

{ #category : #initialization }
CollectableApp >> startCollectionsManager [

	CollectableCollectionsManager start: self componentName
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
CollectableApp >> stopCollectionsManager [

	CollectableCollectionsManager stop: self componentName
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

{ #category : #private }
CollectableApp >> updateTitle [

	| nb title |
	
	title := '[|||] Collectable (alpha version)'.
	
	nb := collectibleList data size.
	nb > 0 ifTrue:[
		title := title, ' - ' , nb asString , ' collectible(s)'.
	].

	space title: title.
]
