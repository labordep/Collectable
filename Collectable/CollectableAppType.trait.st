Trait {
	#name : #CollectableAppType,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Collectable-Core'
}

{ #category : #'accessing - events' }
CollectableAppType classSide >> consumedComponentEvents [
	<componentContract>
	^ {CollectableCollectionsManagerEvents}
]

{ #category : #'accessing - services' }
CollectableAppType classSide >> usedComponentServices [
	<componentContract>
	^ {CollectOSProjectManagerServices . CollectableCollectionsManagerServices}
]
