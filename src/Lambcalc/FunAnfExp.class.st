Class {
	#name : #FunAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'params',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
FunAnfExp class >> binding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  params: aCollection
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #initialization }
FunAnfExp >> initializeBinding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	params := aCollection.
	body := anAnfExp.
	rest := anAnfExp2
]
