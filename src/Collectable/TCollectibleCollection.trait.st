Trait {
	#name : 'TCollectibleCollection',
	#instVars : [
		'collectibles'
	],
	#category : 'Collectable-Model-Traits-Collectible',
	#package : 'Collectable',
	#tag : 'Model-Traits-Collectible'
}

{ #category : 'collectibles - add-remove' }
TCollectibleCollection >> addCollectible: aCollectible [

	self collectibles add: aCollectible
]

{ #category : 'collectibles - add-remove' }
TCollectibleCollection >> addCollectibles: aCollectibleList [

	self collectibles addAll: aCollectibleList
]

{ #category : 'accessing' }
TCollectibleCollection >> collectibles [

	^ collectibles ifNil:[collectibles := OrderedCollection new]
]

{ #category : 'querying' }
TCollectibleCollection >> includesReference: aReference [

	^ self collectibles anySatisfy: [ :e | e referenceString = aReference ]
]

{ #category : 'testing' }
TCollectibleCollection >> isEmpty [

	^ self collectibles isEmpty
]

{ #category : 'querying' }
TCollectibleCollection >> lessRecentDateAddedCollectible [
	"Return the oldest date added collectible"
	
	^ (self collectibles copy sort: [ :a :b | a dateAdded < b dateAdded ]) 
		ifEmpty: [ nil ] 
		ifNotEmpty: [ :e | e first ] 
]

{ #category : 'querying' }
TCollectibleCollection >> mostRecentDateAddedCollectible [
	"Return the oldest date added collectible"
	
	^ (self collectibles copy sort: [ :a :b | a dateAdded > b dateAdded ]) 
		ifEmpty: [ nil ] 
		ifNotEmpty: [ :e | e first ] 
]

{ #category : 'statistics' }
TCollectibleCollection >> numberOfCollectibles [
	
	^ self collectibles size
]

{ #category : 'collectibles - add-remove' }
TCollectibleCollection >> removeAllCollectibles [

	self collectibles removeAll
]

{ #category : 'collectibles - add-remove' }
TCollectibleCollection >> removeCollectible: aCollectible [

	self collectibles remove: aCollectible ifAbsent: [ nil ]
]

{ #category : 'collectibles - add-remove' }
TCollectibleCollection >> removeCollectibles: aCollectibleList [

	aCollectibleList do:[ :e | self removeCollectible: e ]
]

{ #category : 'querying' }
TCollectibleCollection >> uniqueCollectibles [
	"Return a not duplicated collectibles"
	| referenceList |

	referenceList := Dictionary new.
	self collectibles do:[ :e | | reference |
		reference := e referenceString.
		
		"Conserve the element with the highest completion"
		(referenceList includesKey: reference) ifFalse:[ 
			referenceList at: reference put: e 
		] ifTrue:[ | completion eCompletion |
			completion := (referenceList at: reference) completion.
			eCompletion := e completion.
			(completion notNil and:[eCompletion notNil]) ifTrue:[
				(completion accomplishment) < (eCompletion accomplishment) ifTrue:[referenceList at: reference put: e].
			]
		].
	].
	
	^ referenceList values
]
