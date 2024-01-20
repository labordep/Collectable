Extension { #name : #CollecWorld }

{ #category : #'*Collectable-Gameye' }
CollecWorld class >> importGameyeSpreadsheetCollectionsAsDefaultCollections [

	| manager fileReference collectionList |
	manager := Smalltalk os isWindows ifTrue:[ CollectOSWindowsManager start: #world ] ifFalse:[ CollectOSPharoManager start: #world].
	
	fileReference := manager openFileReference: 'GAMEYE.app Spreadsheet' onDirectory: FileSystem workingDirectory extensions: #('csv').	
	MolUtils stopComponent: manager class named: #world.
	
	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ self ].
	
	collectionList := CollecGameyeUtils importCollectionsFromGameyeSpreadsheetFile: fileReference asFileReference type: GameyeCollection owned.
	collectionList ifEmpty:[ ^ self ].
	
	CollectableUserdatas cleanUp.
	
	collectionList do:[ :c | CollectableUserdatas default collections add: c ].
]

{ #category : #'*Collectable-Gameye' }
CollecWorld class >> menu20ImportDefaultCollectionOn: aBuilder [

	<worldMenu>
	(aBuilder item: #ImportDefaultCollection)
		parent: #Collectable;
		label: 'Import default collections from GAMEYE.app spreadsheet';
		action: [ self importGameyeSpreadsheetCollectionsAsDefaultCollections ];
		help: 'Import video games, peripherals and systems owned collections from GAMEYE.app Spreadsheet'.
]
