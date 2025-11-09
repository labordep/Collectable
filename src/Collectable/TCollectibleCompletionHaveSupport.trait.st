Trait {
	#name : 'TCollectibleCompletionHaveSupport',
	#instVars : [
		'haveSupport',
		'isDigital'
	],
	#category : 'Collectable-Model-Traits-Completion',
	#package : 'Collectable',
	#tag : 'Model-Traits-Completion'
}

{ #category : 'accessing' }
TCollectibleCompletionHaveSupport >> haveSupport [

	^ haveSupport ifNil: [ haveSupport := false ]
]

{ #category : 'accessing' }
TCollectibleCompletionHaveSupport >> haveSupport: anObject [

	haveSupport := anObject
]

{ #category : 'accessing' }
TCollectibleCompletionHaveSupport >> isDigital [

	^ isDigital
]

{ #category : 'accessing' }
TCollectibleCompletionHaveSupport >> isDigital: anObject [

	isDigital := anObject
]
