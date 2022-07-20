Class {
	#name : #TupleAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'values',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
TupleAnfExp class >> binding: aString values: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  values: aCollection
		  rest: anAnfExp
]

{ #category : #initialization }
TupleAnfExp >> initializeBinding: aString values: aCollection rest: anAnfExp [

	binding := aString.
	values := aCollection.
	rest := anAnfExp
]
