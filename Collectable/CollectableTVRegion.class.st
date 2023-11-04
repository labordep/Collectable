Class {
	#name : #CollectableTVRegion,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : #'Collectable-Model-Properties'
}

{ #category : #enumerating }
CollectableTVRegion class >> All [

	^ self new type: #All; name: 'All'
]

{ #category : #enumerating }
CollectableTVRegion class >> NTSC [

	^ self new type: #NTSC; name: 'NTSC'
]

{ #category : #enumerating }
CollectableTVRegion class >> PAL [

	^ self new type: #PAL; name: 'PAL'
]

{ #category : #enumerating }
CollectableTVRegion class >> SECAM [

	^ self new type: #SECAM; name: 'SECAM'
]

{ #category : #enumerating }
CollectableTVRegion class >> Unknown [

	^ self new type: #Unknown; name: 'Unknown'
]

{ #category : #printing }
CollectableTVRegion >> name [

	^ name
]

{ #category : #printing }
CollectableTVRegion >> name: anObject [

	name := anObject
]

{ #category : #printing }
CollectableTVRegion >> printOn: aStream [

	aStream nextPutAll: (self name ifNil:['Unknown TV region'])
]

{ #category : #printing }
CollectableTVRegion >> type [

	^ type
]

{ #category : #printing }
CollectableTVRegion >> type: anObject [

	type := anObject
]
