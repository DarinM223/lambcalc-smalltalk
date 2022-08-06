Class {
	#name : #PtrToIntInsn,
	#superclass : #Insn,
	#instVars : [
		'ty1',
		'ptr',
		'ty2'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
PtrToIntInsn class >> ty1: aTy ptr: anOperand ty2: aTy2 [

	^ self new ty1: aTy ptr: anOperand ty2: aTy2
]

{ #category : #'as yet unclassified' }
PtrToIntInsn >> ty1: aTy1 ptr: anOperand ty2: aTy2 [

	ty1 := aTy1.
	ptr := anOperand.
	ty2 := aTy2
]
