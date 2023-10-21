Class {
	#name : #CollecWorld,
	#superclass : #Object,
	#classInstVars : [
		'collection'
	],
	#category : #'Collectable-IDE'
}

{ #category : #actions }
CollecWorld class >> cleanDefaultCollection [

	collection := nil
]

{ #category : #accessing }
CollecWorld class >> defaultCollection [ 

	^ collection
]

{ #category : #actions }
CollecWorld class >> importGameyeSpreadsheetCollectionAsDefaultCollection [

	| manager fileReference collec |
	manager := Smalltalk os isWindows ifTrue:[ CollectOSWindowsManager start: #world ] ifFalse:[ CollectOSPharoManager start: #world].
	
	fileReference := manager openFileReference: 'GAMEYE.app Spreadsheet' onDirectory: FileSystem workingDirectory extensions: #('csv').	
	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ nil ].
	
	collec := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (fileReference asFileReference).
	collec ifNil:[ ^ self ].
	
	collection := CollecGameyeUtils createCollection: (collec at: GameyeCollection owned).
	
	MolUtils stopComponent: manager class named: #world.
]

{ #category : #menu }
CollecWorld class >> menu00CollectableOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Collectable)
		label: '[|||] Collectable';
		help: 'An application project to manage stuff collector';
		order: 777
]

{ #category : #menu }
CollecWorld class >> menu10OpenCollectableOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Open)
		parent: #Collectable;
		label: 'Open';
		action: [ self startApplication ];
		help: 'Open a new Collectable window'.
]

{ #category : #menu }
CollecWorld class >> menu20ImportDefaultCollectionOn: aBuilder [

	<worldMenu>
	(aBuilder item: #ImportDefaultCollection)
		parent: #Collectable;
		label: 'Import default collection (From GAMEYE.app)';
		action: [ self importGameyeSpreadsheetCollectionAsDefaultCollection ];
		help: 'Import a collection by default - only GAMEYE.app Spreadsheet import support'.
]

{ #category : #menu }
CollecWorld class >> menu30CleanDefaultCollectionOn: aBuilder [

	<worldMenu>
	(aBuilder item: #CleanDefaultCollection)
		parent: #Collectable;
		label: 'Clean default collection';
		action: [ self cleanDefaultCollection ];
		help: 'Clean the default collection - remove all datas'.
]

{ #category : #actions }
CollecWorld class >> startApplication [

	| randomizedId |
	randomizedId := self name, (Random new next * 1000000) rounded asString.
	CollectableApp start: (randomizedId asSymbol)
]
