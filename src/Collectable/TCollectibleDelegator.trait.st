Trait {
	#name : #TCollectibleDelegator,
	#instVars : [
		'delegate'
	],
	#category : #'Collectable-Model-Traits-Collectible'
}

{ #category : #accessing }
TCollectibleDelegator classSide >> delegate: anObject [

	^ self new delegate: anObject
]

{ #category : #accessing }
TCollectibleDelegator >> delegate [

	^ delegate
]

{ #category : #accessing }
TCollectibleDelegator >> delegate: anObject [

	delegate ~= anObject ifFalse: [ ^ self ].
	delegate := anObject.
	self initializeDelegation
]

{ #category : #accessing }
TCollectibleDelegator >> haveDelegate [

	^ delegate notNil
]

{ #category : #accessing }
TCollectibleDelegator >> initializeDelegation [
]
