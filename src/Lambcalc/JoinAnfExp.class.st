Class {
	#name : #JoinAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'valueBinding',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
JoinAnfExp class >> binding: aString valueBinding: aString2 body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #initialization }
JoinAnfExp >> initializeBinding: aString valueBinding: aString2 body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp.
	rest := anAnfExp2
]
