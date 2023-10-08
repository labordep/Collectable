Class {
	#name : #CollecWorld,
	#superclass : #Object,
	#category : #'Collectable-IDE'
}

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
	(aBuilder item: #Collectable)
		parent: #Collectable;
		label: 'Open';
		action: [ self startApplication ];
		help: 'Open a new Collectable window'.
]

{ #category : #actions }
CollecWorld class >> startApplication [

	CollectableApp start
]
