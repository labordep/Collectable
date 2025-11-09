Class {
	#name : 'CollectOSWindowsManager',
	#superclass : 'CollectOSPharoManager',
	#traits : 'CollecOSProjectManagerType',
	#classTraits : 'CollecOSProjectManagerType classTrait',
	#category : 'Collectable-OSProject',
	#package : 'Collectable',
	#tag : 'OSProject'
}

{ #category : 'private' }
CollectOSWindowsManager >> buildFileExtensionsList: aFileExtensionsList [
	"Return '*.ext;*.ext' list"

	| extensions |
	aFileExtensionsList ifNil:[ ^ nil ].
	aFileExtensionsList isEmpty ifTrue:[ ^ nil].
	
	extensions := String new.
	aFileExtensionsList do:[ :e | extensions := extensions ,'*.', e asString ] separatedBy: [ extensions := extensions , ';' ].
	^ extensions
]

{ #category : 'services - files' }
CollectOSWindowsManager >> openFileReference: aTitle onDirectory: aStartDirectory extensions: aFileExtensionsList [

	"ignore title"
	| fileReference extensions |

	extensions := self buildFileExtensionsList: aFileExtensionsList.

	fileReference := WinFileDialog openFilename: aTitle extension: extensions initialDir: FileSystem workingDirectory.
	^fileReference
]
