Trait {
	#name : #TCollectibleGameyePeripheral,
	#traits : 'TCollectibleGameyeCollectible',
	#classTraits : 'TCollectibleGameyeCollectible classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #accessing }
TCollectibleGameyePeripheral >> developer [

	^ self delegate developer
]

{ #category : #initialization }
TCollectibleGameyePeripheral >> initializeDelegation [

	self haveDelegate ifFalse: [ ^ self ].
	self createPlatform.
	self updateCompletion
]

{ #category : #accessing }
TCollectibleGameyePeripheral >> name [

	^ self delegate title
]

{ #category : #accessing }
TCollectibleGameyePeripheral >> publisher [

	^ self delegate publisher
]
