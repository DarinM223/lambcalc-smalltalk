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

{ #category : #accessing }
ConstOperand >> val: anInteger [

	val := anInteger
]
