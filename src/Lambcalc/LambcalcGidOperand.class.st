Class {
	#name : #LambcalcGidOperand,
	#superclass : #LambcalcOperand,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LambcalcGidOperand class >> var: aString [

	^ self new var: aString
]

{ #category : #printing }
LambcalcGidOperand >> printOn: aStream [

	aStream
		nextPutAll: '@';
		nextPutAll: var
]

{ #category : #accessing }
LambcalcGidOperand >> var: aString [ 
	var := aString
]
