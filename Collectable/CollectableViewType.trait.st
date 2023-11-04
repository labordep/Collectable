Trait {
	#name : #CollectableViewType,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Collectable-UI'
}

{ #category : #'accessing - events' }
CollectableViewType classSide >> consumedComponentEvents [
	<componentContract>
	^ {CollectableCollectionsManagerEvents}
]

{ #category : #'accessing - events' }
CollectableViewType classSide >> producedComponentEvents [
	<componentContract>
	^ {CollectableViewEvents } 
]

{ #category : #'accessing - services' }
CollectableViewType classSide >> providedComponentServices [
	<componentContract>
	^ {CollectableViewServices} 
]

{ #category : #'accessing - services' }
CollectableViewType classSide >> usedComponentServices [
	<componentContract>
	^ {CollectableCollectionsManagerServices}
]
