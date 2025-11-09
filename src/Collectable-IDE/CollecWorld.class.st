Class {
	#name : #CollecWorld,
	#superclass : #Object,
	#category : #'Collectable-IDE'
}

{ #category : #menu }
CollecWorld class >> menu00CollectableOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Collectable)
		label: CollectableAppImpl windowTitleHead;
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
		action: [ CollectableUserdatas default collections inspect ];
		help: 'Open an inspector on default collections'.
]

{ #category : #menu }
CollecWorld class >> menu30CleanDefaultCollectionOn: aBuilder [

	<worldMenu>
	(aBuilder item: #CleanDefaultCollection)
		parent: #Collectable;
		label: 'Clean default collections';
		action: [ CollectableUserdatas cleanUp ];
		help: 'Remove all collections datas'.
]

{ #category : #actions }
CollecWorld class >> startApplication [

	CollectableAppImpl start: (MolUtils randomizeComponentName)
]
