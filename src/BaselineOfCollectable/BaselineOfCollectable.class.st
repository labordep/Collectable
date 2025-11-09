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
				package: 'Collectable-VideoGames' with: [ spec requires: #('Collectable') ];
				package: 'Collectable-Gameye' with: [ spec requires: #('Gameye' 'Collectable-VideoGames') ];
				package: 'Collectable-IDE' with: [ spec requires: #('Collectable') ];
				package: 'Collectable-Gameye-IDE' with: [ spec requires: #('Gameye' 'Collectable-IDE') ];
				package: 'Collectable-Tests' with: [ spec requires: #('Collectable') ];
				package: 'Collectable-VideoGames-Tests' with: [ spec requires: #('Collectable-VideoGames') ];
				package: 'Collectable-Gameye-Tests' with: [ spec requires: #('Collectable-Gameye') ];
				package: 'Collectable-Incubator' with: [ spec requires: #('Collectable') ].
		]
]

{ #category : #baselines }
BaselineOfCollectable >> dependencies: spec [

	"Functionnality to import Pharo Gameye datas"
	spec baseline: 'Gameye' with: [ spec repository: 'github://labordep/PharoGameye:2.0.3' ].

	"OS-Windows management layer for the UI"
	Smalltalk os isWindows ifTrue: [
		spec baseline: 'OSWindowsOpenSmock' with: [ spec repository: 'github://OpenSmock/OS-Windows:main' ].		
	].	

	"UI editor: Pyramid"
	spec baseline: 'Pyramid' with: [ spec repository: 'github://OpenSmock/Pyramid:main' ].
	
	"Component architecture framework: Molecule"
	spec baseline: 'Molecule' with: [ spec repository: 'github://OpenSmock/Molecule:1.3.4' ].
]
