Class {
	#name : #LcGlobAnfValue,
	#superclass : #LcAnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LcGlobAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #'llvm lowering' }
LcGlobAnfValue >> lower [

	^ LcGidOperand var: var
]

{ #category : #accessing }
LcGlobAnfValue >> var: aString [

	var := aString
]
