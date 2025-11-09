Extension { #name : #GameyePeripheral }

{ #category : #'*Collectable-Gameye' }
GameyePeripheral >> asCollectible [

	^ CollectibleGameyePeripheral delegate: self
]
