Class {
	#name : #CollecWorld,
	#superclass : #Object,
	#classInstVars : [
		'collections'
	],
	#category : #'Collectable-IDE'
}

{ #category : #actions }
CollecWorld class >> cleanDefaultCollections [

	collections ifNotNil:[ 
		self defaultCollections removeAll. 
		collections := nil.
	].
]

{ #category : #accessing }
CollecWorld class >> defaultCollections [ 

	^ collections ifNil:[collections := OrderedCollection new]
]

{ #category : #menu }
CollecWorld class >> menu00CollectableOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Collectable)
		label: CollectableApp windowTitleHead;
		help: 'An application project to manage stuff collector';
		order: 777
]

{ #category : #menu }
CollecWorld class >> menu10OpenCollectableOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Open)
		parent: #Collectable;
		order: 1;
		label: 'Open';
		action: [ self startApplication ];
		help: 'Open a new Collectable window'.
]

{ #category : #menu }
CollecWorld class >> menu11InspectDefaultCollectionsOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Open)
		parent: #Collectable;
		label: 'Inspect default collections';
		action: [ self defaultCollections inspect ];
		help: 'Open an inspector on default collections'.
]

{ #category : #menu }
CollecWorld class >> menu30CleanDefaultCollectionOn: aBuilder [

	<worldMenu>
	(aBuilder item: #CleanDefaultCollection)
		parent: #Collectable;
		label: 'Clean default collections';
		action: [ self cleanDefaultCollections ];
		help: 'Remove all collections datas'.
]

{ #category : #actions }
CollecWorld class >> startApplication [

	CollectableApp start: (MolUtils randomizeComponentName)
]
