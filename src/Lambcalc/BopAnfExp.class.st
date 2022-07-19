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

{ #category : #'free variables' }
BopAnfExp >> freeVarsWith: aSet [

	| leftFreeVars rightFreeVars restFreeVars |
	leftFreeVars := left freeVarsWith: aSet.
	rightFreeVars := right freeVarsWith: aSet.
	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ (leftFreeVars union: rightFreeVars) union: restFreeVars
]

{ #category : #initialization }
BopAnfExp >> initializeBinding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	binding := aString.
	op := aClass.
	left := anAnfValue.
	right := anAnfValue2.
	rest := anAnfExp
]
