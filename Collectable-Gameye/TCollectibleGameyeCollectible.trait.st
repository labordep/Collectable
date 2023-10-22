Trait {
	#name : #TCollectibleGameyeCollectible,
	#traits : 'TCollectibleDelegator',
	#classTraits : 'TCollectibleDelegator classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #accessing }
TCollectibleGameyeCollectible >> dateAdded [

	^ self delegate dateAdded
]

{ #category : #accessing }
TCollectibleGameyeCollectible >> platform [

	^ self delegate platform
]

{ #category : #accessing }
TCollectibleGameyeCollectible >> printIdentifierOn: aStream [

	self delegate printIdentifierOn: aStream.
]
