"
A CollectibleVideoGamePeripheralTest is a test class for testing the behavior of CollectibleVideoGamePeripheral
"
Class {
	#name : #CollectibleVideoGamePeripheralTest,
	#superclass : #TestCase,
	#category : #'Collectable-Tests-Model'
}

{ #category : #tests }
CollectibleVideoGamePeripheralTest >> testInitialize [ 

	| collectible |
	collectible := CollectibleVideoGamePeripheral new.
	self assert: collectible platform isNil.
]
