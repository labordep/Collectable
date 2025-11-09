Class {
	#name : 'CollectibleCollection',
	#superclass : 'Object',
	#traits : 'TCollectibleCollection',
	#classTraits : 'TCollectibleCollection classTrait',
	#instVars : [
		'name'
	],
	#category : 'Collectable-Model',
	#package : 'Collectable',
	#tag : 'Model'
}

{ #category : 'converting' }
CollectibleCollection >> asUniqueCollectibles [
	"Return the collection as a new collection without duplicated collectibles"
	
	| collection |
	collection := self class new.
	collection name: ((self name ifNil:['Collection']) asString), ' without duplicated collectibles'.
	collection addCollectibles: self uniqueCollectibles.
	^ collection
]

{ #category : 'accessing' }
CollectibleCollection >> name [

	^ name
]

{ #category : 'accessing' }
CollectibleCollection >> name: anObject [

	name := anObject
]
