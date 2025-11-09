Class {
	#name : #CollectableCollectionsManagerImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableCollectionsManager + CollectableCollectionsManagerServices',
	#classTraits : 'CollectableCollectionsManager classTrait + CollectableCollectionsManagerServices classTrait',
	#instVars : [
		'collectionList'
	],
	#category : #'Collectable-Core'
}

{ #category : #accessing }
CollectableCollectionsManagerImpl >> collectionList [

	^ collectionList ifNil:[collectionList := OrderedCollection new].
]

{ #category : #accessing }
CollectableCollectionsManagerImpl >> collectionList: anObject [

	collectionList := anObject
]

{ #category : #'services- collectibles' }
CollectableCollectionsManagerImpl >> getAllCollectibles [

	| collectibles |
	collectibles := OrderedCollection new.
	self getCollections do:[ :c | collectibles addAll: c collectibles ].
	
	^ collectibles
]

{ #category : #'component accessing' }
CollectableCollectionsManagerImpl >> getCollectableCollectionsManagerEventsNotifier [
	^self eventsNotifiers at: CollectableCollectionsManagerEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: CollectableCollectionsManagerEvents name: nil].
]

{ #category : #'services - collections' }
CollectableCollectionsManagerImpl >> getCollections [

	^ self collectionList
]

{ #category : #'services- collectibles' }
CollectableCollectionsManagerImpl >> numberOfCollectibles [

	^ self getAllCollectibles size
]

{ #category : #'services - collections' }
CollectableCollectionsManagerImpl >> setCollections: aCollectionList [

	self collectionList: aCollectionList.
	
	self getCollectableCollectionsManagerEventsNotifier collectionsHasChanged: aCollectionList 
]
