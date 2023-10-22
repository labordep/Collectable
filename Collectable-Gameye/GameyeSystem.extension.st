Extension { #name : #GameyeSystem }

{ #category : #'*Collectable-Gameye' }
GameyeSystem >> asCollectible [

	^ CollectibleGameyeVideoGame delegate: self
]
