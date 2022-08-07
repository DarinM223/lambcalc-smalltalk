Class {
	#name : #IdOperand,
	#superclass : #Operand,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
IdOperand class >> var: aString [

	^ self new var: aString
]

{ #category : #printing }
IdOperand >> printOn: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: var
]

{ #category : #accessing }
IdOperand >> var: aString [

	var := aString
]
