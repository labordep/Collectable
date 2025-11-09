Class {
	#name : #CollectibleVideoGameCompletion,
	#superclass : #CollectibleCompletion,
	#traits : 'TCollectibleCompletion + TCollectibleCompletionHaveSupport + TCollectibleCompletionHaveBox + TCollectibleCompletionHaveManual',
	#classTraits : 'TCollectibleCompletion classTrait + TCollectibleCompletionHaveSupport classTrait + TCollectibleCompletionHaveBox classTrait + TCollectibleCompletionHaveManual classTrait',
	#category : #'Collectable-VideoGames-Model'
}

{ #category : #accessing }
CollectibleVideoGameCompletion >> accomplishment [
	"Return level of accomplishment of the completion"
	
	| percent |
	self isComplete ifTrue:[ ^ 100 percent ].
	
	percent := 0 percent.
	
	self haveSupport ifTrue:[ percent := percent + (50 percent) ].
	self haveBox ifTrue:[ percent := percent + (40 percent) ].
	self haveManual ifTrue:[ percent := percent + (10 percent) ].
	
	^ percent percent
]

{ #category : #printing }
CollectibleVideoGameCompletion >> completionString [

	"Complete states"
	| includes |
	self isNew ifTrue:[ ^ 'New' ].
	self isComplete ifTrue:[ ^ 'CIB' ].
	
	"Uncomplete states"
	includes := self includes.
	includes ifNotEmpty: [ | stream |
		stream := ReadWriteStream on: String new. 
		self includes do:[ :e | stream nextPutAll: (e first asString); space ].
		^ stream contents
	].
 	
	"Unknown state"
	^ super completionString
]

{ #category : #accessing }
CollectibleVideoGameCompletion >> includes [

	| includes |
	includes := OrderedCollection new.
	self haveBox ifTrue:[ includes add: #box ].
	self haveSupport ifTrue:[ includes add: #support ].
	self haveManual ifTrue:[ includes add: #manual ].
	^ includes
]

{ #category : #accessing }
CollectibleVideoGameCompletion >> missing [

	| missing |
	missing := OrderedCollection new.
	self haveBox ifFalse:[ missing add: #box ].
	self haveSupport ifFalse:[ missing add: #support ].
	self haveManual ifFalse:[ missing add: #manual ].
	^ missing
]
