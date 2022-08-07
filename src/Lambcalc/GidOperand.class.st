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

{ #category : #printing }
GidOperand >> printOn: aStream [

	aStream
		nextPutAll: '@';
		nextPutAll: var
]

{ #category : #accessing }
GidOperand >> var: aString [ 
	var := aString
]
