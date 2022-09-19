Class {
	#name : #LcGidOperand,
	#superclass : #LcOperand,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcGidOperand class >> var: aString [

	^ self new var: aString
]

{ #category : #printing }
LcGidOperand >> printOn: aStream [

	aStream
		nextPutAll: '@';
		nextPutAll: var
]

{ #category : #accessing }
LcGidOperand >> var: aString [ 
	var := aString
]
