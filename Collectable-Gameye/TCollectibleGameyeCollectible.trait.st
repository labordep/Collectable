Trait {
	#name : #TCollectibleGameyeCollectible,
	#traits : 'TCollectibleDelegator',
	#classTraits : 'TCollectibleDelegator classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #accessing }
TCollectibleGameyeCollectible >> country [

	^ self delegate country
]

{ #category : #private }
TCollectibleGameyeCollectible >> createPlatform [

	self platform: (CollecGameyeUtils createPlatform: self delegate platform)
]

{ #category : #accessing }
TCollectibleGameyeCollectible >> dateAdded [

	^ self delegate dateAdded
]

{ #category : #initialization }
TCollectibleGameyeCollectible >> initializeDelegation [

	self explicitRequirement
]

{ #category : #accessing }
TCollectibleGameyeCollectible >> monetaryValue [

	^ self delegate yourPrice ifNil:[ 0 ] ifNotNil: [ :e | e max: 0 ]
]

{ #category : #accessing }
TCollectibleGameyeCollectible >> pricePaid [

	^ self delegate pricePaid ifNil:[ 0 ] ifNotNil: [ :e | e max: 0 ]
]

{ #category : #private }
TCollectibleGameyeCollectible >> updateCompletion [ 

	self completion isNew: self delegate isSealed.
	self completion haveManual: self delegate haveManual.
	self completion haveBox: self delegate haveBox.
	self completion haveSupport: (self delegate isBoxedPlus or:[self delegate isLoose or:[self delegate isLoosePlus or:[self delegate isCIB or:[self delegate isCIBPlus or:[self delegate isSealed]]]]]).
	"self completion isDigital: self delegate ownership." self flag:'labordep: todo'.
	
]
