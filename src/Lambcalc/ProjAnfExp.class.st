Class {
	#name : #ProjAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'tupleName',
		'index',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
ProjAnfExp class >> binding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  tupleName: aString2
		  index: anInteger
		  rest: anAnfExp
]

{ #category : #initialization }
ProjAnfExp >> initializeBinding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	binding := aString.
	tupleName := aString2.
	index := anInteger.
	rest := anAnfExp
]
