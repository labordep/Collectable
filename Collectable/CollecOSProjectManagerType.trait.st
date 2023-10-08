Trait {
	#name : #CollecOSProjectManagerType,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Collectable-OSProject'
}

{ #category : #'accessing - services' }
CollecOSProjectManagerType classSide >> providedComponentServices [
	<componentContract>
	^ { CollectOSProjectManagerServices  } 
]
