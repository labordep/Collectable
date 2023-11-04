"
A CollectibleVideoGameSystemTest is a test class for testing the behavior of CollectibleVideoGameSystem
"
Class {
	#name : #CollectibleVideoGameSystemTest,
	#superclass : #TestCase,
	#category : #'Collectable-Tests-Model'
}

{ #category : #tests }
CollectibleVideoGameSystemTest >> testInitialize [ 

	| collectible |
	collectible := CollectibleVideoGameSystem new.
	self assert: collectible typeString equals: 'System'.
	self assert: collectible completion class equals: CollectibleVideoGameCompletion.
	
	"Testing methods"
	self deny: collectible isVideoGame.
	self deny: collectible isVideoGamePeripheral.
	self assert: collectible isVideoGameSystem.
]
