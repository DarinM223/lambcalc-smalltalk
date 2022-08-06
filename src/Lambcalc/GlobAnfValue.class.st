Class {
	#name : #GlobAnfValue,
	#superclass : #AnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
GlobAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #'llvm lowering' }
GlobAnfValue >> lower [

	^ GidOperand var: var
]

{ #category : #accessing }
GlobAnfValue >> var: aString [

	var := aString
]
