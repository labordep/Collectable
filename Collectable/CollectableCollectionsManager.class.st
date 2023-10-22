Class {
	#name : #CollectableCollectionsManager,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableCollectionsManagerType + CollectableCollectionsManagerServices',
	#classTraits : 'CollectableCollectionsManagerType classTrait + CollectableCollectionsManagerServices classTrait',
	#instVars : [
		'collectionList'
	],
	#category : #'Collectable-Core'
}

{ #category : #accessing }
CollectableCollectionsManager >> collectionList [

	^ collectionList ifNil:[collectionList := OrderedCollection new].
]

{ #category : #accessing }
CollectableCollectionsManager >> collectionList: anObject [

	collectionList := anObject
]

{ #category : #'services- collectibles' }
CollectableCollectionsManager >> getAllCollectibles [

	| collectibles |
	collectibles := OrderedCollection new.
	self getCollections do:[ :c | collectibles addAll: c collectibles ].
	
	^ collectibles
]

{ #category : #'component accessing' }
CollectableCollectionsManager >> getCollectableCollectionsManagerEventsNotifier [
	^self eventsNotifiers at: CollectableCollectionsManagerEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: CollectableCollectionsManagerEvents name: nil].
]

{ #category : #'services - collections' }
CollectableCollectionsManager >> getCollections [

	^ self collectionList
]

{ #category : #'services- collectibles' }
CollectableCollectionsManager >> numberOfCollectibles [

	^ self getAllCollectibles size
]

{ #category : #'services - collections' }
CollectableCollectionsManager >> setCollections: aCollectionList [

	self collectionList: aCollectionList.
	
	self getCollectableCollectionsManagerEventsNotifier collectionsHasChanged: aCollectionList 
]
