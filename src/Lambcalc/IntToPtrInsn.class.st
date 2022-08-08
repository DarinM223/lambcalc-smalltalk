Class {
	#name : #IntToPtrInsn,
	#superclass : #Insn,
	#instVars : [
		'ty1',
		'val',
		'ty2'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
IntToPtrInsn class >> ty1: aTy val: anOperand ty2: aTy2 [

	^ self new initializeTy1: aTy val: anOperand ty2: aTy2
]

{ #category : #initialization }
IntToPtrInsn >> initializeTy1: aTy val: anOperand ty2: aTy2 [

	ty1 := aTy.
	val := anOperand.
	ty2 := aTy2
]

{ #category : #printing }
IntToPtrInsn >> printOn: aStream [

	aStream nextPutAll: 'inttoptr '.
	ty1 printOn: aStream.
	aStream nextPutAll: ' '.
	val printOn: aStream.
	aStream nextPutAll: ' to '.
	ty2 printOn: aStream
]
