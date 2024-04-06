Trait {
	#name : #TCollectibleGameyeSystem,
	#traits : 'TCollectibleGameyeCollectible',
	#classTraits : 'TCollectibleGameyeCollectible classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #initialization }
TCollectibleGameyeSystem >> initializeDelegation [

	self haveDelegate ifFalse: [ ^ self ].
	self updateCompletion
]
