Class {
	#name : #LcOperand,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcOperand >> printGepIndexOn: aStream [

	aStream nextPutAll: 'i64 '.
	self printOn: aStream
]
