"
A CollectibleVideoGameTest is a test class for testing the behavior of CollectibleVideoGame
"
Class {
	#name : #CollectibleVideoGameTest,
	#superclass : #TestCase,
	#category : #'Collectable-Tests-Model'
}

{ #category : #tests }
CollectibleVideoGameTest >> testInitialize [ 

	| collectible |
	collectible := CollectibleVideoGame new.
	self assert: collectible platform isNil.
]
