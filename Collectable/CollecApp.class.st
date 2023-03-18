Class {
	#name : #CollecApp,
	#superclass : #Object,
	#category : #'Collectable-POC'
}

{ #category : #plugin }
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
