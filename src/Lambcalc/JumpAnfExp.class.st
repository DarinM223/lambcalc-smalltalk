Class {
	#name : #JumpAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'join',
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
JumpAnfExp class >> join: aString val: anAnfValue [

	^ self new initializeJoin: aString val: anAnfValue
]

{ #category : #initialization }
JumpAnfExp >> initializeJoin: aString val: anAnfValue [

	join := aString.
	val := anAnfValue
]
