Class {
	#name : 'CollectOSPharoManager',
	#superclass : 'MolAbstractComponentImpl',
	#traits : 'CollecOSProjectManagerType + CollectOSProjectManagerServices',
	#classTraits : 'CollecOSProjectManagerType classTrait + CollectOSProjectManagerServices classTrait',
	#category : 'Collectable-OSProject',
	#package : 'Collectable',
	#tag : 'OSProject'
}

{ #category : 'private' }
CollectOSPharoManager >> buildFileExtensionsList: aFileExtensionsList [
	"Return #('ext' 'ext') list"

	aFileExtensionsList ifNil:[ ^ nil ].
	aFileExtensionsList isEmpty ifTrue:[ ^ nil].
	
	^ aFileExtensionsList asSet asArray
]

{ #category : 'services - files' }
CollectOSPharoManager >> openFileReference: aTitle onDirectory: aStartDirectory extensions: aFileExtensionsList [

	"ignore title"
	| fileReference extensions |

	extensions := self buildFileExtensionsList: aFileExtensionsList.

	fileReference := UIManager default chooseExistingFileReference: nil extensions: extensions path: aStartDirectory.
	^fileReference
]
