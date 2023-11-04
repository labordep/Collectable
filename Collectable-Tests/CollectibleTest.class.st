"
A CollectibleTest is a test class for testing the behavior of Collectible
"
Class {
	#name : #CollectibleTest,
	#superclass : #TestCase,
	#category : #'Collectable-Tests-Model'
}

{ #category : #test }
CollectibleTest >> testInitialize [

	| collectible |
	collectible := Collectible new.
	self assert: collectible dateAdded isNil.
	self assert: collectible name isNil.
	self assert: collectible typeString equals: 'Collectible'.
	self assert: collectible completion class equals: CollectibleCompletion.
	
	"Testing methods"
	self deny: collectible isVideoGame.
	self deny: collectible isVideoGamePeripheral.
	self deny: collectible isVideoGameSystem.
]
