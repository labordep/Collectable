Trait {
	#name : 'TCollectibleCompletion',
	#instVars : [
		'isNew'
	],
	#category : 'Collectable-Model-Traits-Completion',
	#package : 'Collectable',
	#tag : 'Model-Traits-Completion'
}

{ #category : 'accessing' }
TCollectibleCompletion >> accomplishment [
	"Return level of accomplishment of the completion"
	
	self isComplete ifTrue:[ ^ 100 percent ].
	^ 0 percent
]

{ #category : 'printing' }
TCollectibleCompletion >> completionString [

	^ self isComplete ifTrue:['Complete'] ifFalse:['Uncomplete']
]

{ #category : 'accessing' }
TCollectibleCompletion >> includes [

	^ OrderedCollection new
]

{ #category : 'testing' }
TCollectibleCompletion >> isComplete [

	^ self missing isEmpty
]

{ #category : 'accessing' }
TCollectibleCompletion >> isNew [

	^ isNew ifNil: [ isNew := false ]
]

{ #category : 'accessing' }
TCollectibleCompletion >> isNew: aBoolean [

	isNew := aBoolean
]

{ #category : 'accessing' }
TCollectibleCompletion >> missing [

	^ OrderedCollection new
]
