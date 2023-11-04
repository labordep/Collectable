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
	self assert: collectible typeString equals: 'Game'.
	self assert: collectible completion class equals: CollectibleVideoGameCompletion.
	
	"Testing methods"
	self assert: collectible isVideoGame.
	self deny: collectible isVideoGamePeripheral.
	self deny: collectible isVideoGameSystem.
]
