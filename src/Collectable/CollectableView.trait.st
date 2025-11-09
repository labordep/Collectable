Trait {
	#name : #CollectableView,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Collectable-UI'
}

{ #category : #'accessing - events' }
CollectableView classSide >> consumedComponentEvents [
	<componentContract>
	^ {CollectableCollectionsManagerEvents}
]

{ #category : #'accessing - events' }
CollectableView classSide >> producedComponentEvents [
	<componentContract>
	^ {CollectableViewEvents } 
]

{ #category : #'accessing - services' }
CollectableView classSide >> providedComponentServices [
	<componentContract>
	^ {CollectableViewServices} 
]

{ #category : #'accessing - services' }
CollectableView classSide >> usedComponentServices [
	<componentContract>
	^ {CollectableCollectionsManagerServices}
]
