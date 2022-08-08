Class {
	#name : #LambcalcGlobAnfValue,
	#superclass : #LambcalcAnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LambcalcGlobAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #'llvm lowering' }
LambcalcGlobAnfValue >> lower [

	^ LambcalcGidOperand var: var
]

{ #category : #accessing }
LambcalcGlobAnfValue >> var: aString [

	var := aString
]
