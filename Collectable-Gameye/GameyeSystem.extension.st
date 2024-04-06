Extension { #name : #GameyeSystem }

{ #category : #'*Collectable-Gameye' }
GameyeSystem >> asCollectible [

	^ CollectibleGameyeSystem delegate: self
]
