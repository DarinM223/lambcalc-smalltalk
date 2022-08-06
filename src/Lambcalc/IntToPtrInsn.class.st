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

	^ self new initializeWithTy1: aTy val: anOperand ty2: aTy2
]

{ #category : #initialization }
IntToPtrInsn >> initializeWithTy1: aTy val: anOperand ty2: aTy2 [

	ty1 := aTy.
	val := anOperand.
	ty2 := aTy2
]
