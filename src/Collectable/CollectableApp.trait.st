Trait {
	#name : 'CollectableApp',
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : 'Collectable-Core',
	#package : 'Collectable',
	#tag : 'Core'
}

{ #category : 'accessing - events' }
CollectableApp classSide >> consumedComponentEvents [
	<componentContract>
	^ {CollectableCollectionsManagerEvents}
]

{ #category : 'accessing - services' }
CollectableApp classSide >> usedComponentServices [
	<componentContract>
	^ {CollectOSProjectManagerServices . CollectableCollectionsManagerServices}
]
