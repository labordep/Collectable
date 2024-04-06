Class {
	#name : #CollectibleGameyeSystem,
	#superclass : #CollectibleVideoGameSystem,
	#traits : 'TCollectibleGameyeSystem',
	#classTraits : 'TCollectibleGameyeSystem classTrait',
	#category : #'Collectable-Gameye-Core'
}

{ #category : #initialization }
CollectibleGameyeSystem >> name [

	^ self delegate ifNotNil:[ :e | e title ] ifNil:[ super name ]
]
