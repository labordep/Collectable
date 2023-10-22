Extension { #name : #GameyePeripheral }

{ #category : #'*Collectable-Gameye' }
GameyePeripheral >> asCollectible [

	^ CollectibleGameyeVideoGame delegate: self
]
