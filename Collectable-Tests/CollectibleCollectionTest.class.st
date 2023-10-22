"
A CollectibleCollectionTest is a test class for testing the behavior of CollectibleCollection
"
Class {
	#name : #CollectibleCollectionTest,
	#superclass : #TestCase,
	#category : #'Collectable-Tests-Model'
}

{ #category : #tests }
CollectibleCollectionTest >> testInitialize [ 

	| collection |
	collection := CollectibleCollection new.
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection name isNil.
]
