Trait {
	#name : #TCollectibleDelegator,
	#instVars : [
		'delegate'
	],
	#category : #'Collectable-Model-Traits'
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

	delegate := anObject
]

{ #category : #accessing }
TCollectibleDelegator >> haveDelegate [

	^ delegate notNil
]
