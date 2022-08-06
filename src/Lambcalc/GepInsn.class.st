Class {
	#name : #GepInsn,
	#superclass : #Insn,
	#instVars : [
		'ty',
		'ptr',
		'indexes'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
GepInsn class >> ty: aTy ptr: anOperand indexes: aCollection [

	^ self new initializeWithTy: aTy ptr: anOperand indexes: aCollection
]

{ #category : #initialization }
GepInsn >> initializeWithTy: aTy ptr: anOperand indexes: aCollection [

	ty := aTy.
	ptr := anOperand.
	indexes := aCollection
]
