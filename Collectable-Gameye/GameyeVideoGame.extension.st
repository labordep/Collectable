Extension { #name : #GameyeVideoGame }

{ #category : #'*Collectable-Gameye' }
GameyeVideoGame >> asCollectible [

	^ CollectibleVideoGame wrapGameyeCollectible: self
]
