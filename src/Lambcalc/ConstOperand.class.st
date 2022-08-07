Class {
	#name : #ConstOperand,
	#superclass : #Operand,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
ConstOperand class >> val: anInteger [

	^ self new val: anInteger
]

{ #category : #printing }
ConstOperand >> printGepIndexOn: aStream [

	aStream nextPutAll: 'i32 '.
	val printOn: aStream
]

{ #category : #printing }
ConstOperand >> printOn: aStream [

	val printOn: aStream
]

{ #category : #accessing }
ConstOperand >> val: anInteger [

	val := anInteger
]
