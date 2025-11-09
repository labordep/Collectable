Class {
	#name : #CollectablePlatform,
	#superclass : #Collectable,
	#instVars : [
		'name'
	],
	#category : #'Collectable-Model'
}

{ #category : #accessing }
CollectablePlatform >> name [

	^ name
]

{ #category : #accessing }
CollectablePlatform >> name: anObject [

	name := anObject
]

{ #category : #printing }
CollectablePlatform >> printOn: aStream [

	aStream nextPutAll: (self name ifNil:['Unknown platform'])
]
