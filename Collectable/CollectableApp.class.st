Class {
	#name : #CollectableApp,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableAppType',
	#classTraits : 'CollectableAppType classTrait',
	#instVars : [
		'mainPane',
		'space',
		'collectibleList'
	],
	#category : #'Collectable-Core'
}

{ #category : #actions }
CollectableApp >> browseAndImportGameyeCollecFromExportedSpreadsheet [

	| fileReference |
	
	fileReference := self getCollectOSProjectManagerServicesProvider openFileReference: 'GAMEYE.app Spreadsheet' onDirectory: FileSystem workingDirectory extensions: #('csv').	
	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ nil ].
	
	^ GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (fileReference asFileReference)
]

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

		platformPane := ToPane new id: #platformPanel; beVertical; background: (self getPlatformColor: collectible platform); width: 100; vMatchParent.
		blContent addChild: platformPane.
		
   	 	contentPane := ToPane new id: #contentPane; beVertical; background: (Color fromHexString: 'D1C4E9'); vMatchParent; hMatchParent.
		blContent addChild: contentPane.
		
		typeLabel := ToLabel new id: #typeLabel; text: (collectible type asString).
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
	| menu loadCollectionMenu |

	menu := ToMenu new.
	menu id: #menu.
	menu layout cellSpacing: 5.
	menu columnWidth: 22.
	menu label: (ToLabel new text: 'File').
	menu icon: (ToImage new innerImage: (self iconNamed: #solidMenu)).
	
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
	
	^menu
]

{ #category : #releasing }
CollectableApp >> closeSpace [

	space ifNil:[ ^ self ].
	space isOpened ifTrue:[ space close ].
]

{ #category : #'life cycle' }
CollectableApp >> componentActivate [

	self openSpace
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

	aPlatform = 'SNES' ifTrue:[ ^ Color red ].
	aPlatform = 'NES' ifTrue:[ ^ Color red ].
	aPlatform = 'GBA' ifTrue:[ ^ Color red ].
	aPlatform = 'Wii' ifTrue:[ ^ Color red ].
	aPlatform = 'NDS' ifTrue:[ ^ Color red ].
	
	aPlatform = 'GENESIS' ifTrue:[ ^ Color black ].
	aPlatform = 'Dreamcast' ifTrue:[ ^ Color black ].

	aPlatform = 'PS1' ifTrue:[ ^ Color blue ].
	aPlatform = 'PS2' ifTrue:[ ^ Color blue ].
	aPlatform = 'PS3' ifTrue:[ ^ Color blue ].
	aPlatform = 'PS4' ifTrue:[ ^ Color blue ].
	aPlatform = 'PS5' ifTrue:[ ^ Color blue ].
	
	aPlatform = 'Xbox' ifTrue:[ ^ Color green ].
	aPlatform = 'Xbox 360' ifTrue:[ ^ Color green ].
	
	^ Color gray
	
]

{ #category : #actions }
CollectableApp >> importGameyeSpreadsheetCollection [

	| collec |
	collec := self browseAndImportGameyeCollecFromExportedSpreadsheet.
	collec ifNil:[ ^ nil ].
	
	collectibleList data removeAll.
	collectibleList data addAll: collec collectibles.
]

{ #category : #initialization }
CollectableApp >> initializeMainPane [

	| menu title |
	mainPane := ToPane new beVertical.
	mainPane matchParent.
	
	"Menu"
	menu := self buildMenu.
	mainPane addChild: menu.

	"Title"
	title := ToLabel text: ('Collectibles').
	title id: #title.
	mainPane addChild: title.
	
	"List"
	collectibleList := self buildList.
	mainPane addChild: collectibleList
]

{ #category : #initialization }
CollectableApp >> openSpace [	

	space ifNotNil:[ ^ self ].
	space := mainPane openInSpace.
	
	"setup space properties"
	space title: 'Collectable'.
	space position: 100 @ 100.

	"initialize event handlers"
	space when: BlSpaceClosedEvent do:[ self class stop: self componentName ].
	
	^ space
]

{ #category : #initialization }
CollectableApp >> startOSProjectManager [

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager start ].
	^ CollectOSPharoManager start
]

{ #category : #releasing }
CollectableApp >> stopOSProjectManager [

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager stop ].
	^ CollectOSPharoManager stop
]
