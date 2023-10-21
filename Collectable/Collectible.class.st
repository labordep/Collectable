Class {
	#name : #Collectible,
	#superclass : #Object,
	#traits : 'TCollectible',
	#classTraits : 'TCollectible classTrait',
	#category : #'Collectable-Model'
}

{ #category : #'instance creation' }
Collectible class >> wrapGameyeCollectible: aGameyeCollectible [ 

	^ self subclassResponsibility
]
