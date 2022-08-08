Class {
	#name : #LambcalcNullOperand,
	#superclass : #LambcalcOperand,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcNullOperand >> printOn: aStream [

	aStream nextPutAll: 'null'
]
