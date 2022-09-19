Class {
	#name : #LcNullOperand,
	#superclass : #LcOperand,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcNullOperand >> printOn: aStream [

	aStream nextPutAll: 'null'
]
