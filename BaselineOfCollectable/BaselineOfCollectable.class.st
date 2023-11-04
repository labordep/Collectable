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
				package: 'Collectable-Gameye' with: [ spec requires: #('Gameye' 'Collectable') ];
				package: 'Collectable-IDE' with: [ spec requires: #('Collectable') ];
				package: 'Collectable-Tests' with: [ spec requires: #('Collectable') ];
				package: 'Collectable-Gameye-Tests' with: [ spec requires: #('Collectable-Gameye') ];
				package: 'Collectable-Incubator' with: [ spec requires: #('Collectable') ].
		]
]

{ #category : #baselines }
BaselineOfCollectable >> dependencies: spec [

	"Functionnality to import Pharo Gameye datas"
	spec baseline: 'Gameye' with: [ spec repository: 'github://labordep/PharoGameye:2.0.1' ].

	"OS-Windows management layer for the UI"
	Smalltalk os isWindows ifTrue: [
		spec baseline: 'OSWindows' with: [ spec repository: 'github://astares/Pharo-OS-Windows/src' ].
		
		"OpenSmock OS-Windows extensions"
		spec baseline: 'OSWindowsOpenSmock' with: [ spec repository: 'github://OpenSmock/OS-Windows:main' ].		
	].	

	"UI tool : Pyramid"
	spec baseline: 'Pyramid' with: [ spec repository: 'github://OpenSmock/Pyramid:main/src' ].

	"UI : Toplo with Bloc"
	spec baseline: 'Toplo' with: [ spec repository: 'github://plantec/Toplo:SteelSheet/src' ].
	
	"Architecture framework : Molecule"
	spec baseline: 'Molecule' with: [ spec repository: 'github://OpenSmock/Molecule:1.2.11' ].
]
