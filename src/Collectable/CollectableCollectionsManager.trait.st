Trait {
	#name : 'CollectableCollectionsManager',
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : 'Collectable-Core',
	#package : 'Collectable',
	#tag : 'Core'
}

{ #category : 'accessing - events' }
CollectableCollectionsManager classSide >> producedComponentEvents [
	<componentContract>
	^ {CollectableCollectionsManagerEvents} 
]

{ #category : 'accessing - services' }
CollectableCollectionsManager classSide >> providedComponentServices [
	<componentContract>
	^ {CollectableCollectionsManagerServices} 
]
