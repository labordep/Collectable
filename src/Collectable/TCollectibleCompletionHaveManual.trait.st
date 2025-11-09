Trait {
	#name : #TCollectibleCompletionHaveManual,
	#instVars : [
		'haveManual'
	],
	#category : #'Collectable-Model-Traits-Completion'
}

{ #category : #accessing }
TCollectibleCompletionHaveManual >> haveManual [

	^ haveManual ifNil: [ haveManual := false ]
]

{ #category : #accessing }
TCollectibleCompletionHaveManual >> haveManual: anObject [

	haveManual := anObject
]
