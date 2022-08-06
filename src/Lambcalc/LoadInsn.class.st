Class {
	#name : #LoadInsn,
	#superclass : #Insn,
	#instVars : [
		'ty',
		'ptr'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LoadInsn class >> ty: aPtrTy ptr: anOperand [

	^ self new initializeWithTy: aPtrTy ptr: anOperand
]

{ #category : #initialization }
LoadInsn >> initializeWithTy: aPtrTy ptr: anOperand [

	ty := aPtrTy.
	ptr := anOperand
]
