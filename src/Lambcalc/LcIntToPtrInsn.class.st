Class {
	#name : #LcIntToPtrInsn,
	#superclass : #LcInsn,
	#instVars : [
		'ty1',
		'val',
		'ty2'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcIntToPtrInsn class >> ty1: aTy val: anOperand ty2: aTy2 [

	^ self new initializeTy1: aTy val: anOperand ty2: aTy2
]

{ #category : #initialization }
LcIntToPtrInsn >> initializeTy1: aTy val: anOperand ty2: aTy2 [

	ty1 := aTy.
	val := anOperand.
	ty2 := aTy2
]

{ #category : #printing }
LcIntToPtrInsn >> printOn: aStream [

	aStream nextPutAll: 'inttoptr '.
	ty1 printOn: aStream.
	aStream nextPutAll: ' '.
	val printOn: aStream.
	aStream nextPutAll: ' to '.
	ty2 printOn: aStream
]
