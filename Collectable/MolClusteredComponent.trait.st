Trait {
	#name : #MolClusteredComponent,
	#instVars : [
		'clusterName'
	],
	#category : #'Collectable-MoleculeExtensions'
}

{ #category : #accessing }
MolClusteredComponent >> clusterName [

	^ clusterName ifNil:[ clusterName := 'cluster' ]
]

{ #category : #accessing }
MolClusteredComponent >> clusterName: anObject [

	clusterName := anObject
]
