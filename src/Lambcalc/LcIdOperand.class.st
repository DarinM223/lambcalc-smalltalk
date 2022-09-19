Class {
	#name : #LcIdOperand,
	#superclass : #LcOperand,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcIdOperand class >> var: aString [

	^ self new var: aString
]

{ #category : #printing }
LcIdOperand >> printOn: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: var
]

{ #category : #accessing }
LcIdOperand >> var: aString [

	var := aString
]
