Class {
	#name : #BaselineOfLambcalc,
	#superclass : #BaselineOf,
	#category : #BaselineOfLambcalc
}

{ #category : #baselines }
BaselineOfLambcalc >> baseline: spec [

	spec for: #common do: [ 
		self petitParser: spec.
		spec package: 'Lambcalc' with: [ spec requires: #( 'PetitParser' ) ] ]
]

{ #category : #'baseline dependencies' }
BaselineOfLambcalc >> petitParser: spec [

	spec
		baseline: 'PetitParser'
		with: [ 
		spec repository: 'github://moosetechnology/PetitParser:v3.x.x/src' ]
]
