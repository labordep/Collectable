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
				package: 'Collectable'";
				package: 'Collectable-Tests' with: [ spec requires: #('Collectable') ];
				package: 'Collectable-Examples' with: [ spec requires: #('Collectable') ]".
		]
]

{ #category : #baselines }
BaselineOfCollectable >> dependencies: spec [

	"Load Pharo-gameye project (Fonctionnality)"
	spec baseline: 'Gameye' with: [ spec repository: 'github://labordep/PharoGameye:main' ].

	"Load OS-Windows OpenSmock (UI)"
	Smalltalk os isWindows ifTrue: [
		spec
			baseline: 'OSWindowsOpenSmock'
			with: [ spec repository: 'github://OpenSmock/OS-Windows:main' ].
	].

	"Load Toplo project (UI)"
	spec baseline: 'Toplo' with: [ spec repository: 'github://plantec/Toplo:master/src' ]
]
