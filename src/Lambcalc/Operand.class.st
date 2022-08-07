Class {
	#name : #Operand,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
Operand >> printGepIndexOn: aStream [

	aStream nextPutAll: 'i64 '.
	self printOn: aStream
]
