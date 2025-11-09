Class {
	#name : #CollectibleCatalog,
	#superclass : #Object,
	#traits : 'TCollectibleCollection',
	#classTraits : 'TCollectibleCollection classTrait',
	#instVars : [
		'name',
		'collectibles'
	],
	#category : #'Collectable-Model'
}

{ #category : #accessing }
CollectibleCatalog >> name [

	^ name
]

{ #category : #accessing }
CollectibleCatalog >> name: anObject [

	name := anObject
]
