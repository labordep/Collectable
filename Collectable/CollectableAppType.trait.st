Trait {
	#name : #CollectableAppType,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Collectable-Core'
}

{ #category : #'accessing - services' }
CollectableAppType classSide >> usedComponentServices [
	<componentContract>
	^ {CollectOSProjectManagerServices}
]
