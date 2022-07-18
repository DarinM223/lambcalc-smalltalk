Class {
	#name : #HaltAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
HaltAnfExp class >> val: anAnfValue [

	^ self new val: anAnfValue
]

{ #category : #accessing }
HaltAnfExp >> val: anAnfValue [

	val := anAnfValue
]
