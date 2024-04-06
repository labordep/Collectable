Extension { #name : #GameyeSystem }

{ #category : #'*Collectable-Gameye' }
GameyeSystem >> asCollectible [

	^ (CollecGameyeUtils createPlatform: self platform) delegate: self
]
