Class {
	#name : #LambcalcIdOperand,
	#superclass : #LambcalcOperand,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LambcalcIdOperand class >> var: aString [

	^ self new var: aString
]

{ #category : #printing }
LambcalcIdOperand >> printOn: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: var
]

{ #category : #accessing }
LambcalcIdOperand >> var: aString [

	var := aString
]
