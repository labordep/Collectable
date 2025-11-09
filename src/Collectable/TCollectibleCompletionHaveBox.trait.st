Trait {
	#name : 'TCollectibleCompletionHaveBox',
	#instVars : [
		'haveBox'
	],
	#category : 'Collectable-Model-Traits-Completion',
	#package : 'Collectable',
	#tag : 'Model-Traits-Completion'
}

{ #category : 'accessing' }
TCollectibleCompletionHaveBox >> haveBox [

	^ haveBox ifNil: [ haveBox := false ]
]

{ #category : 'accessing' }
TCollectibleCompletionHaveBox >> haveBox: anObject [

	haveBox := anObject
]
