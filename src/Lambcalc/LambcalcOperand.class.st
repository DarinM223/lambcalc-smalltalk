Class {
	#name : #LambcalcOperand,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcOperand >> printGepIndexOn: aStream [

	aStream nextPutAll: 'i64 '.
	self printOn: aStream
]
