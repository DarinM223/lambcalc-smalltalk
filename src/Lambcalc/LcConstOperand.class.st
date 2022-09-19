Class {
	#name : #LcConstOperand,
	#superclass : #LcOperand,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcConstOperand class >> val: anInteger [

	^ self new val: anInteger
]

{ #category : #printing }
LcConstOperand >> printGepIndexOn: aStream [

	aStream nextPutAll: 'i32 '.
	val printOn: aStream
]

{ #category : #printing }
LcConstOperand >> printOn: aStream [

	val printOn: aStream
]

{ #category : #accessing }
LcConstOperand >> val: anInteger [

	val := anInteger
]
