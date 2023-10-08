Class {
	#name : #BaselineOfCollectable,
	#superclass : #BaselineOf,
	#category : #BaselineOfCollectable
}

{ #category : #baselines }
BaselineOfCollectable >> baseline: spec [
	<baseline>

	spec for: #common
		do: [
			"Dependencies"
			self dependencies: spec.

			"Project Packages"
			spec
				package: 'Collectable';
				package: 'Collectable-IDE' with: [ spec requires: #('Collectable') ].
		]
]

{ #category : #baselines }
BaselineOfCollectable >> dependencies: spec [

	"Functionnality to import Pharo Gameye datas"
	spec baseline: 'Gameye' with: [ spec repository: 'github://labordep/PharoGameye:2.0' ].

	"Windows management layer for the UI"
	Smalltalk os isWindows ifTrue: [
		spec baseline: 'OSWindows' with: [ spec repository: 'github://astares/Pharo-OS-Windows/src' ].
	].

	"UI tool : Pyramid"
	spec baseline: 'Pyramid' with: [ spec repository: 'github://OpenSmock/Pyramid:dev/src' ].

	"UI : Toplo with Bloc"
	spec baseline: 'Toplo' with: [ spec repository: 'github://plantec/Toplo:master/src' ].
	
	"Architecture framework : Molecule"
	spec baseline: 'Molecule' with: [ spec repository: 'github://OpenSmock/Molecule:1.2.11' ].
]
