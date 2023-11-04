Trait {
	#name : #TCollectibleCompletion,
	#instVars : [
		'isNew'
	],
	#category : #'Collectable-Model-Traits-Completion'
}

{ #category : #printing }
TCollectibleCompletion >> completionString [

	^ self isComplete ifTrue:['Complete'] ifFalse:['Uncomplete']
]

{ #category : #testing }
TCollectibleCompletion >> includes [

	^ OrderedCollection new
]

{ #category : #testing }
TCollectibleCompletion >> isComplete [

	^ self missing isEmpty
]

{ #category : #testing }
TCollectibleCompletion >> isNew [

	^ isNew ifNil: [ isNew := false ]
]

{ #category : #testing }
TCollectibleCompletion >> isNew: aBoolean [

	isNew := aBoolean
]

{ #category : #testing }
TCollectibleCompletion >> missing [

	^ OrderedCollection new
]
