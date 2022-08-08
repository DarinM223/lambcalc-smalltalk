Class {
	#name : #LambcalcConstOperand,
	#superclass : #LambcalcOperand,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LambcalcConstOperand class >> val: anInteger [

	^ self new val: anInteger
]

{ #category : #printing }
LambcalcConstOperand >> printGepIndexOn: aStream [

	aStream nextPutAll: 'i32 '.
	val printOn: aStream
]

{ #category : #printing }
LambcalcConstOperand >> printOn: aStream [

	val printOn: aStream
]

{ #category : #accessing }
LambcalcConstOperand >> val: anInteger [

	val := anInteger
]
