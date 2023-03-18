Class {
	#name : #CollecApp,
	#superclass : #Object,
	#instVars : [
		'mainPane',
		'collectibleList'
	],
	#category : #'Collectable-POC'
}

{ #category : #'instance creation' }
CollecApp class >> open [
	<script>
	self new open
]

{ #category : #actions }
CollecApp >> browseAndImportGameyeCollecFromExportedSpreadsheet [

	| fileReference |
	Smalltalk os isWindows ifTrue:[
		fileReference := WinFileDialog openFilename: 'Gameye Spreadsheet' extension: '*.csv'.
	] ifFalse: [
		fileReference := UIManager default chooseExistingFileReference: nil extensions: #('csv') path: FileSystem workingDirectory.
	].

	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ nil ].
	^ GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (fileReference asFileReference)
]

{ #category : #initialization }
CollecApp >> buildList [
	| list |

	list := ToListElement new nodeFactory: [ :collectible :holder |
		| title platform blContent |
		blContent := ToLabeledNode new.
		blContent height: 50; hMatchParent.

		title := ToLabel new id: #title;
			            text: collectible title;
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
		blContent addChild: title.

		platform := ToLabel new id: #platform;
							text: (collectible platform asRopedText bold);
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
		blContent addChild: platform.

		collectible isVideoGame ifTrue:[ | developer publisher |
			developer := ToLabel new id: #developer;
							text: collectible developer;
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
			blContent addChild: developer.

			publisher := ToLabel new id: #publisher;
							text: collectible publisher;
			            margin: (BlInsets all: 1);
			            padding: (BlInsets all: 1);
			            yourself.
			blContent addChild: publisher.
		].

		collectible isSystem ifTrue:[
			"todo"
		].

		blContent
	].

	list withRowNumbers.
	^ list
]

{ #category : #initialization }
CollecApp >> buildMenu [
	| menu loadCollectionMenu |

	menu := ToMenu new.
	menu id: #menu.
	menu layout cellSpacing: 5.
	menu globalColumnWidth: 22.
	menu label: (ToLabel new text: 'File').
	menu icon: (ToImage new innerImage: (self iconNamed: #solidMenu)).
	
	loadCollectionMenu := ToMenu new.
	loadCollectionMenu label: (ToLabel new text: 'Load collection').
	loadCollectionMenu icon: (ToImage new innerImage: (self iconNamed: #down)).
	menu addItem: loadCollectionMenu.
	
	loadCollectionMenu addItem: (
		ToButtonMenuItem new 
			label: (ToLabel new text: 'From Gameye Spreadsheet'); 
			icon: (ToImage new innerImage: (self iconNamed: #box));
			whenClickedDo:[self importGameyeSpreadsheetCollection]
	).
	
	^menu
]

{ #category : #actions }
CollecApp >> importGameyeSpreadsheetCollection [

	| collec |
	collec := self browseAndImportGameyeCollecFromExportedSpreadsheet.
	collec ifNil:[ ^ nil ].
	
	collectibleList data removeAll.
	collectibleList data addAll: collec collectibles.
]

{ #category : #initialization }
CollecApp >> initialize [

	| title menu |
	super initialize.

	mainPane := ToPane new beVertical.
	mainPane matchParent.
	
	"Menu"
	menu := self buildMenu.
	mainPane addChild: menu.

	"Title"
	title := ToLabel text: ('Collectible list').
	title id: #title.
	mainPane addChild: title.
	
	"List"
	collectibleList := self buildList.
	mainPane addChild: collectibleList
]

{ #category : #initialization }
CollecApp >> open [
	| space |

	space := mainPane openInOBlSpace.
	space title: 'Collectable - alpha version'.
	space position: 100@100.
	^space
]
