Class {
	#name : #CollectibleGameyeVideoGame,
	#superclass : #CollectibleVideoGame,
	#traits : 'TCollectibleDelegator',
	#classTraits : 'TCollectibleDelegator classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #accessing }
CollectibleGameyeVideoGame >> dateAdded [

	^ self delegate dateAdded
]

{ #category : #accessing }
CollectibleGameyeVideoGame >> platform [

	^ self delegate platform
]

{ #category : #accessing }
CollectibleGameyeVideoGame >> printIdentifierOn: aStream [

	self delegate printIdentifierOn: aStream.
]
