Trait {
	#name : #CollectableCollectionsManagerType,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Collectable-Core'
}

{ #category : #'accessing - events' }
CollectableCollectionsManagerType classSide >> producedComponentEvents [
	<componentContract>
	^ {CollectableCollectionsManagerEvents} 
]

{ #category : #'accessing - services' }
CollectableCollectionsManagerType classSide >> providedComponentServices [
	<componentContract>
	^ {CollectableCollectionsManagerServices} 
]
