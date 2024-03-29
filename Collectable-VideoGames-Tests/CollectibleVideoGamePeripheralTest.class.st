"
A CollectibleVideoGamePeripheralTest is a test class for testing the behavior of CollectibleVideoGamePeripheral
"
Class {
	#name : #CollectibleVideoGamePeripheralTest,
	#superclass : #TestCase,
	#category : #'Collectable-VideoGames-Tests'
}

{ #category : #tests }
CollectibleVideoGamePeripheralTest >> testInitialize [ 

	| collectible |
	collectible := CollectibleVideoGamePeripheral new.
	self assert: collectible platform isNil.
	self assert: collectible typeString equals: 'Peripheral'.
	self assert: collectible completion class equals: CollectibleVideoGameCompletion.
	
	"Testing methods"
	self deny: collectible isVideoGame.
	self assert: collectible isVideoGamePeripheral.
	self deny: collectible isVideoGameSystem.
]
