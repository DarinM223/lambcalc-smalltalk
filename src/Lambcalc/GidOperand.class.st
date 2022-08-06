Class {
	#name : #GidOperand,
	#superclass : #Operand,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
GidOperand class >> var: aString [

	^ self new var: aString
]

{ #category : #accessing }
GidOperand >> var: aString [ 
	var := aString
]
