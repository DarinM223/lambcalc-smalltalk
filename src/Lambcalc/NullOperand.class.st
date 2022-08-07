Class {
	#name : #NullOperand,
	#superclass : #Operand,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
NullOperand >> printOn: aStream [

	aStream nextPutAll: 'null'
]
