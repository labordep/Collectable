Extension { #name : #MolUtils }

{ #category : #'*Collectable' }
MolUtils class >> randomizeComponentName [

	| randomizedId |
	self flag:'labordep: manage a key stack which is reset at each molecule cleanup'.
	randomizedId := 'Component', (Random new next * 100000000) rounded asString.
	^ randomizedId asSymbol
]
