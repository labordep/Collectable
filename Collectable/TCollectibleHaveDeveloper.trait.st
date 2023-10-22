Trait {
	#name : #TCollectibleHaveDeveloper,
	#instVars : [
		'publisher',
		'developer'
	],
	#category : #'Collectable-Model-Traits'
}

{ #category : #accessing }
TCollectibleHaveDeveloper >> developer [

	^ developer
]

{ #category : #accessing }
TCollectibleHaveDeveloper >> developer: anObject [

	developer := anObject
]
