Class {
	#name : #BopAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'op',
		'left',
		'right',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
BopAnfExp class >> binding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  op: aClass
		  left: anAnfValue
		  right: anAnfValue2
		  rest: anAnfExp
]

{ #category : #initialization }
BopAnfExp >> initializeBinding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	binding := aString.
	op := aClass.
	left := anAnfValue.
	right := anAnfValue2.
	rest := anAnfExp
]
