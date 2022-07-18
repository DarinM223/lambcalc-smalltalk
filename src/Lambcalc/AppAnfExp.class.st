Class {
	#name : #AppAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'funName',
		'params',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
AppAnfExp class >> binding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  funName: aVarAnfValue
		  params: aCollection
		  rest: anAnfExp
]

{ #category : #initialization }
AppAnfExp >> initializeBinding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	binding := aString.
	funName := aVarAnfValue.
	params := aCollection.
	rest := anAnfExp
]
