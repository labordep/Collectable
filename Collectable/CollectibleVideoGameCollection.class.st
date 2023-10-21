Class {
	#name : #CollectibleVideoGameCollection,
	#superclass : #CollectibleCollection,
	#category : #'Collectable-Model'
}

{ #category : #accessing }
CollectibleVideoGameCollection >> initialize [ 

	super initialize.
	self collections at: #videoGames put: (CollectibleCollection new name: 'Video Games').
	self collections at: #systems put: (CollectibleCollection new name: 'Game Systems').
	self collections at: #peripherals put: (CollectibleCollection new name: 'Game Peripherals').
]

{ #category : #accessing }
CollectibleVideoGameCollection >> peripherals [

	^ self collections at: #peripherals
]

{ #category : #accessing }
CollectibleVideoGameCollection >> systems [

	^ self collections at: #systems
]

{ #category : #accessing }
CollectibleVideoGameCollection >> videoGames [

	^ self collections at: #videoGames
]
