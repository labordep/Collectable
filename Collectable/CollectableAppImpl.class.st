Class {
	#name : #CollectableAppImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableApp + CollectableCollectionsManagerEvents',
	#classTraits : 'CollectableApp classTrait + CollectableCollectionsManagerEvents classTrait',
	#instVars : [
		'mainPane',
		'space',
		'collectibleList',
		'searchField',
		'statsPane'
	],
	#category : #'Collectable-Core'
}

{ #category : #ui }
CollectableAppImpl class >> windowTitleHead [

	^ '[|||] Collectable (alpha version)'.
]

{ #category : #private }
CollectableAppImpl >> buildList [
	| list |

	list := ToListElement new nodeBuilder: [ :node :holder |
		self buildListNode: node holder: holder.
	].

	list withRowNumbers.
	^ list
]

{ #category : #private }
CollectableAppImpl >> buildListNode: node holder: holder [
		| collectible typePane typeLabel platformPane contentPane title country platform secondPane statePane stateLabel completion |

		collectible := holder data.
		node layout: BlFlowLayout horizontal.
		node height: 50; hMatchParent.

		typePane := ToPane new id: #typePanel; beVertical; background: (Color fromHexString: 'D1C4E9C8'); width: 25; vMatchParent.
		node addChild: typePane.

		platformPane := ToPane new id: #platformPanel; beVertical; background: ((self getPlatformColor: collectible platform) alpha: 0.75); width: 200; vMatchParent.
		node addChild: platformPane.
		
		statePane := ToPane new id: #statePanel; beVertical; background: (Color fromHexString: 'D1C4E9C8'); width: 25; vMatchParent.
		node addChild: statePane.
		
		title := ToLabel new id: #title;
			           text: (collectible name asRopedText foreground: (Color fromHexString: '673AB7'); fontSize: 24; bold);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
		node addChild: title.
		
   	 	contentPane := ToPane new id: #contentPane; beVertical; background: (Color fromHexString: 'D1C4E9C8'); vMatchParent; hFitContent.
		node addChild: contentPane.
		
		typeLabel := ToLabel new id: #typeLabel; text: ((collectible typeString asRopedText) fontSize: 10).
		typeLabel transformDo: [ :t | t normalizedOrigin: 0 @ 1. t rotateBy: 90 ].
		typePane addChild: typeLabel.

		platform := ToLabel new id: #platform;
							text: (collectible platform asUppercase asRopedText foreground: (Color white); fontSize: 20);
			            padding: (BlInsets all: 1);
			            yourself.
		platformPane addChild: platform.

		stateLabel := ToLabel new id: #stateLabel; text: ((collectible completion completionString asRopedText) fontSize: 15).
		stateLabel transformDo: [ :t | t normalizedOrigin: 0 @ 1. t rotateBy: 90 ].
		statePane addChild: stateLabel.

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

		secondPane := ToPane new id: #datePane; beVertical; background: (Color fromHexString: 'D1C4E9C8'); vMatchParent; hFitContent.
		secondPane addChild:(ToLabel new id: #dateAdded;
							text: (('Added ', collectible dateAdded asString) asRopedText foreground: (Color brown); fontSize: 12);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself).
		node addChild: secondPane.
]

{ #category : #private }
CollectableAppImpl >> buildMenu [
	| fileMenu loadCollectionMenu menuBar debugMenu openOnPyramid queryMenu searchNoCountryCollectibles orderMenu orderByAlphaIncrease orderByAlphaDecrease orderByAddedDateIncrease orderByAddedDateDecrease searchCollectibles fullsetMenu queryN64Menu queryWiiUMenu |

	menuBar := (ToMenuBar id: #menuBar) hFitContent.

	"File menu"
	fileMenu := ToMenu new.
	fileMenu id: #menu.
	fileMenu layout cellSpacing: 5.
	fileMenu label: (ToLabel new text: 'File').
	fileMenu icon: (ToImage new innerImage: (self iconNamed: #solidMenu)).
	menuBar addMenu: fileMenu.
	
	"Stats"
	fileMenu addItem:(
		ToMenuItem new
			label: (ToLabel new text: 'Prices stats');
			icon: (ToImage new innerImage: (self iconNamed: #remote));
			whenClickedDo:[ | list collections |
				list := OrderedCollection new.
				collections := self getCollectableCollectionsManagerServicesProvider getCollections.
				collections do:[ :c | list addAll: c collectibles ].
				self openPricesStat: list 
			]
	).
	
	"Fullset menu"
	fullsetMenu := ToMenu new.
	fullsetMenu label: (ToLabel new text: 'Fullsets').
	fullsetMenu icon: (ToImage new innerImage: (self iconNamed: #box)).
	fileMenu addItem: fullsetMenu.
	fullsetMenu addItem: (
		ToMenuItem new
			label: (ToLabel new text: 'Fullset stats : Nintendo 64 PAL FRA');
			icon: (ToImage new innerImage: (self iconNamed: #box));
			whenClickedDo:[self openFullsetStat: CollectibleVideoGameFullset nintendo64_PAL_FRA ]
	).
	fullsetMenu addItem: (
		ToMenuItem new
			label: (ToLabel new text: 'Fullset stats : Wii U PAL FRA');
			icon: (ToImage new innerImage: (self iconNamed: #box));
			whenClickedDo:[self openFullsetStat: CollectibleVideoGameFullset nintendoWiiU_PAL_FRA ]
	).
	fullsetMenu addItem: (
		ToMenuItem new
			label: (ToLabel new text: 'Fullset stats : Pokemon mini PLA FRA');
			icon: (ToImage new innerImage: (self iconNamed: #box));
			whenClickedDo:[self openFullsetStat: CollectibleVideoGameFullset nintendoPokemonMini_PAL_FRA ]
	).
	fullsetMenu addItem: (
		ToMenuItem new
			label: (ToLabel new text: 'Fullset stats : Pokemon games PAL FRA');
			icon: (ToImage new innerImage: (self iconNamed: #box));
			whenClickedDo:[self openFullsetStat: CollectibleVideoGameFullset allPokemonLicenceGame_PAL_FRA ]
	).

	"Load menu"
	loadCollectionMenu := ToMenu new.
	loadCollectionMenu label: (ToLabel new text: 'Load collection').
	loadCollectionMenu icon: (ToImage new innerImage: (self iconNamed: #down)).
	fileMenu addItem: loadCollectionMenu.
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
			whenClickedDo:[self searchAction: [ :e | e country isNil ]].
	queryMenu addItem: searchNoCountryCollectibles.
	
	searchCollectibles := ToMenuItem new 
			label: (ToLabel new text: 'Added last month'); 
			whenClickedDo:[self searchAction: [ :e |
				e dateAdded month = (Date today month previous)  ]
			].
	queryMenu addItem: searchCollectibles.
	
	searchCollectibles := ToMenuItem new 
			label: (ToLabel new text: 'Added this month'); 
			whenClickedDo:[self searchAction: [ :e |
				e dateAdded month = (Date today month)  ]
			].
	queryMenu addItem: searchCollectibles.
	
	"Query N64 menu"
	queryN64Menu := ToMenu new.
	queryN64Menu label: (ToLabel new text: 'Nintendo 64').
	queryN64Menu icon: (ToImage new innerImage: (self iconNamed: #box)).
	queryMenu addItem: queryN64Menu.
	queryN64Menu addItem:(
		searchCollectibles := ToMenuItem new 
			label: (ToLabel new text: 'Added this month'); 
			whenClickedDo:[self searchAction: [ :e |
				e isVideoGame and:[ (e dateAdded month = (Date today month)) and:[e platform = 'Nintendo 64'] ] ]
			]
	).
	queryN64Menu addItem:(
		searchCollectibles := ToMenuItem new 
			label: (ToLabel new text: 'Added last month'); 
			whenClickedDo:[self searchAction: [ :e |
				e isVideoGame and:[ (e dateAdded month = (Date today month previous)) and:[e platform = 'Nintendo 64'] ] ]
			]
	).
	
	"Query WiiU menu"
	queryWiiUMenu := ToMenu new.
	queryWiiUMenu label: (ToLabel new text: 'Nintendo Wii U').
	queryWiiUMenu icon: (ToImage new innerImage: (self iconNamed: #box)).
	queryMenu addItem: queryWiiUMenu.
	queryWiiUMenu addItem:(
		ToMenuItem new 
			label: (ToLabel new text: 'Added this month'); 
			whenClickedDo:[self searchAction: [ :e |
				e isVideoGame and:[ (e dateAdded month = (Date today month)) and:[e platform = 'Nintendo Wii U'] ] ]
			]
	).
	queryWiiUMenu addItem:(
		ToMenuItem new 
			label: (ToLabel new text: 'Added last month'); 
			whenClickedDo:[self searchAction: [ :e |
				e isVideoGame and:[ (e dateAdded month = (Date today month previous)) and:[e platform = 'Nintendo Wii U'] ] ]
			]
	).
	
	"Order menu"
	orderMenu := ToMenu new.
	orderMenu id: #query.
	orderMenu layout cellSpacing: 5.
	orderMenu label: (ToLabel new text: 'Order by').
	orderMenu icon: (ToImage new innerImage: (self iconNamed: #changeSorter)).
	menuBar addMenu: orderMenu.
	
	"Order buttons"
	orderByAlphaIncrease := ToMenuItem new 
			label: (ToLabel new text: 'Name');
			iconImage: (self iconNamed: #arrowDown); 
			whenClickedDo:[self orderAction: [ :a :b | a name < b name ]].
	orderMenu addItem: orderByAlphaIncrease.
	
	orderByAlphaDecrease := ToMenuItem new 
			label: (ToLabel new text: 'Name'); 
			iconImage: (self iconNamed: #arrowUp ); 
			whenClickedDo:[self orderAction: [ :a :b | a name > b name ]].
	orderMenu addItem: orderByAlphaDecrease.

	orderByAddedDateIncrease := ToMenuItem new 
			label: (ToLabel new text: 'Added date'); 
			iconImage: (self iconNamed: #arrowDown ); 
			whenClickedDo:[self orderAction: [ :a :b | a dateAdded < b dateAdded ]].
	orderMenu addItem: orderByAddedDateIncrease.
	
	orderByAddedDateDecrease := ToMenuItem new 
			label: (ToLabel new text: 'Added date'); 
			iconImage: (self iconNamed: #arrowUp ); 
			whenClickedDo:[self orderAction: [ :a :b | a dateAdded > b dateAdded ]].
	orderMenu addItem: orderByAddedDateDecrease.
	
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
CollectableAppImpl >> buildSearchWidget [

	| searchPane searchButton |
	
	searchPane := (ToPane id: #search) beHorizontal; hFitContent.
	
	searchField := ToTextField new
		withoutLineBreak;
		hMatchParent; 
		width: 200; 
		placeholderText: 'Search...';
		tooltipString: 'Type anything here and press Enter to search something';
		addEditorShortcut: (BlShortcutWithAction new
             combination: BlKeyCombination return;
             action: [ :event | self searchAction ]
             yourself).
	searchPane addChild: searchField.
	
	searchButton := ToButton new hMatchParent; width: 50; labelText: 'Search'.
	searchButton whenClickedDo:[ self searchAction ].
	searchPane addChild: searchButton.
	
	^ searchPane
]

{ #category : #private }
CollectableAppImpl >> buildStatsWidgets [

	| label label2 |
	
	statsPane := (ToPane id: #statsPane) beVertical; hFitContent.
	
	"Statistics to display into labels"
	label := ToLabel id: #stats1.
	statsPane addChild: label.
		
	label2 := ToLabel id: #stats2.
	statsPane addChild: label2.
		
	^ statsPane
]

{ #category : #releasing }
CollectableAppImpl >> closeSpace [

	space ifNil:[ ^ self ].
	space isOpened ifTrue:[ space close ].
]

{ #category : #events }
CollectableAppImpl >> collectionsHasChanged: aCollectionList [

	| collectibles |
	collectibles := OrderedCollection new.
	aCollectionList do:[ :c | collectibles addAll: c collectibles ].
	self populateCollectibleListWith: collectibles.
]

{ #category : #'life cycle' }
CollectableAppImpl >> componentActivate [

	self getCollectableCollectionsManagerEventsSubscriber subscribe: self.
 
	self openSpace.
	self openDefaultCollections.
]

{ #category : #'life cycle' }
CollectableAppImpl >> componentInitialize [ 

	CollectablePricesStatView deploy.
	CollectableVideoGameFullsetStatView deploy.
	
	self startOSProjectManager.
	self startCollectionsManager.

	self forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	self forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 

	self initializeMainPane.
]

{ #category : #'life cycle' }
CollectableAppImpl >> componentPassivate [
	
	self getCollectableCollectionsManagerEventsSubscriber unsubscribe: self.

	self closeSpace.
	
]

{ #category : #'life cycle' }
CollectableAppImpl >> componentRemove [ 

	self stopCollectionsManager.
	self stopOSProjectManager
]

{ #category : #'component accessing' }
CollectableAppImpl >> getCollectOSProjectManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectOSProjectManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectOSProjectManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'component accessing' }
CollectableAppImpl >> getCollectableCollectionsManagerEventsSubscriber [
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
CollectableAppImpl >> getCollectableCollectionsManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectableCollectionsManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectableCollectionsManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #private }
CollectableAppImpl >> getPlatformColor: aPlatform [

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
CollectableAppImpl >> importAndBrowseOwnedGameyeSpreadsheetCollections [

	| fileReference collectionList |
	
	fileReference := self getCollectOSProjectManagerServicesProvider openFileReference: 'GAMEYE.app Spreadsheet' onDirectory: FileSystem workingDirectory extensions: #('csv').	
	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ nil ].
	
	collectionList := CollecGameyeUtils importCollectionsFromGameyeSpreadsheetFile: fileReference asFileReference type: GameyeCollection owned.
	collectionList ifEmpty:[ ^ self ].
	
	^ collectionList
]

{ #category : #actions }
CollectableAppImpl >> importGameyeSpreadsheetCollection [

	| collec |
	collec := self importAndBrowseOwnedGameyeSpreadsheetCollections.
	collec ifNil:[ ^ nil ].
	
	self getCollectableCollectionsManagerServicesProvider setCollections: collec
]

{ #category : #initialization }
CollectableAppImpl >> initializeMainPane [

	| menu title menuPane searchWidget statsWidget |
	mainPane := ToPane new beVertical.
	mainPane matchParent.
	
	"Menu"
	menuPane := ToPane new beHorizontal; hFitContent.
	mainPane addChild: menuPane.
	
	menu := self buildMenu.
	menuPane addChild: menu.
	searchWidget := self buildSearchWidget.
	menuPane addChild: searchWidget.
	statsWidget := self buildStatsWidgets.
	menuPane addChild: statsWidget.
	
	"Title"
	title := ToLabel text: ('Collectibles').
	title id: #title.
	mainPane addChild: title.
	
	"List"
	collectibleList := self buildList.
	mainPane addChild: collectibleList
]

{ #category : #actions }
CollectableAppImpl >> openDefaultCollections [

	self getCollectableCollectionsManagerServicesProvider
		setCollections: CollectableUserdatas default collections
]

{ #category : #actions }
CollectableAppImpl >> openFullsetStat: aFullset [

	| component name |
	aFullset ifNil:[ ^ self ].
	name := MolUtils randomizeComponentName.
	component := CollectableVideoGameFullsetStatView instantiate: name.
	component forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	component forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 
	CollectableVideoGameFullsetStatView activate: name.
	
	component setFullset: aFullset.
	component openInWindow
]

{ #category : #actions }
CollectableAppImpl >> openPricesStat: aCollectibleList [

	| component name |
	aCollectibleList ifNil:[ ^ self ].

	name := MolUtils randomizeComponentName.
	component := CollectablePricesStatView deploy.
	
	component := CollectablePricesStatView instantiate: name.
	component forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	component forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 
	CollectablePricesStatView activate: name.
	
	component setCollection: (CollectibleCollection new addCollectibles: aCollectibleList).
	component openInWindow
]

{ #category : #initialization }
CollectableAppImpl >> openSpace [

	space ifNotNil: [ ^ self ].
	space := mainPane openInSpace.

	"setup space properties"
	self updateContent.
	space position: 100 @ 100.

	"initialize event handlers"
	space addEventHandler: (BlEventHandler
			 on: BlSpaceClosedEvent
			 do: [ :e | self receiveBlSpaceClosedEvent: e ]).
	^ space
]

{ #category : #actions }
CollectableAppImpl >> orderAction: aSortBlockClosure [

	| list |
	aSortBlockClosure ifNil:[ ^ self ].
	
	list := collectibleList data asArray asOrderedCollection. 
	list ifEmpty: [ ^ self ].
	
	list sort: aSortBlockClosure.
	
	self populateCollectibleListWith: list.
]

{ #category : #actions }
CollectableAppImpl >> populateCollectibleListWith: aCollectibleList [
	
	collectibleList data removeAll.
	self updateContent.
	
	aCollectibleList ifNil:[ ^ self ].
	aCollectibleList ifEmpty: [ ^ self ].
	
	collectibleList data addAll: aCollectibleList.
	self updateContent.	
	
]

{ #category : #events }
CollectableAppImpl >> receiveBlSpaceClosedEvent: anEvent [
	"The closed event can be send after that the component is stop, because it can be have a ghost window, we need to cheeck if the component is really stopped or not"

	(MolUtils
		 isInstantiateComponentOf: self class
		 named: self componentName) ifTrue: [
		self class stop: self componentName ]
]

{ #category : #actions }
CollectableAppImpl >> searchAction [

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
CollectableAppImpl >> searchAction: aSelectBlockClosure [

	"get the content of the field and do the search"
	| collectibles collections |
	collections := self getCollectableCollectionsManagerServicesProvider getCollections.
	collectibles := OrderedCollection new.
	collections do:[ :c | collectibles addAll: c collectibles ].
	
	collectibles size = 0 ifTrue:[ ^ self ].

	aSelectBlockClosure ifNil:[ self populateCollectibleListWith: collectibles. ^ self ].
	
	collectibles := collectibles select: aSelectBlockClosure.
	self populateCollectibleListWith: collectibles.
]

{ #category : #initialization }
CollectableAppImpl >> startCollectionsManager [

	CollectableCollectionsManagerImpl start: self componentName
]

{ #category : #initialization }
CollectableAppImpl >> startOSProjectManager [

	"Start only if this component is the first instance"
	| apps |
	apps := MolUtils allComponentInstancesOfType: CollectableApp.
	apps size > 1 ifTrue:[ ^ self ].

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager start ].
	^ CollectOSPharoManager start
]

{ #category : #releasing }
CollectableAppImpl >> stopCollectionsManager [

	CollectableCollectionsManagerImpl stop: self componentName
]

{ #category : #releasing }
CollectableAppImpl >> stopOSProjectManager [
	| apps |
	
	"Stop only if this component is the last instance"
	apps := MolUtils allComponentInstancesOfType: CollectableApp.
	(apps size = 1 and:[apps first = self]) ifFalse:[ ^ self ].

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager stop ].
	^ CollectOSPharoManager stop
]

{ #category : #private }
CollectableAppImpl >> updateContent [

	self updateTitle.
	self updateStats.
]

{ #category : #private }
CollectableAppImpl >> updateStats [

	| nb cost value nbNotEstimated text1 text2 diff |
	
	"Stats: cost / value"
	"Stats: (+/- diff)"
	
	cost := 0.
	value := 0.
	nbNotEstimated := 0.
	collectibleList data do:[ :e |
		cost := cost + e pricePaid.
		e monetaryValue = 0 ifTrue:[nbNotEstimated := nbNotEstimated + 1].
		value := value + e monetaryValue.
	].

	diff := (value - cost) rounded.
	diff < 0 ifTrue:[ diff := diff printString ] ifFalse:[ diff := '+', diff printString ].	
	cost := cost rounded printString.
	value := value rounded printString.

	text1 := cost , '€ paid / ' , value , '€ estimated value (', diff , '€)'.
	text2 := nbNotEstimated printString , ' not estimated'.

	(statsPane childWithId: #stats1) text: (text1 asRopedText foreground: (Color black); fontSize: 14).
	(statsPane childWithId: #stats2) text: (text2 asRopedText foreground: (Color black); fontSize: 14).
]

{ #category : #private }
CollectableAppImpl >> updateTitle [

	| nb title |
	
	title := self class windowTitleHead.
	
	nb := collectibleList data size.
	nb > 0 ifTrue:[
		title := title, ' - ' , nb asString , ' collectible(s)'.
	].

	space title: title.
]
