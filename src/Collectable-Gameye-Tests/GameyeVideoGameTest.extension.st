Extension { #name : #GameyeVideoGameTest }

{ #category : #'*Collectable-Gameye-Tests' }
GameyeVideoGameTest >> testAsCollectible [

	| eyegame game |
	eyegame := GameyeVideoGame new.
	game := eyegame asCollectible.
	
	self assert: (game isKindOf: CollectibleVideoGame).
]
