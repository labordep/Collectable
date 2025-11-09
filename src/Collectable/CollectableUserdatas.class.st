"
This class store user datas, including database.
Used it by calling ""default"" instance.
This default instance is shared in the Pharo world.
"
Class {
	#name : #CollectableUserdatas,
	#superclass : #Object,
	#instVars : [
		'collections'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Collectable-Core'
}

{ #category : #cleanup }
CollectableUserdatas class >> cleanUp [

	default := nil
]

{ #category : #default }
CollectableUserdatas class >> default [

	^ default ifNil:[ default := self new ].
]

{ #category : #accessing }
CollectableUserdatas >> collections [

	^ collections ifNil: [ collections := OrderedCollection new ]
]

{ #category : #accessing }
CollectableUserdatas >> collections: anObject [

	collections := anObject
]
