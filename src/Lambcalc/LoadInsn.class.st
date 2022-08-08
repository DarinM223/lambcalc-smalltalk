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

	^ self new initializeTy: aPtrTy ptr: anOperand
]

{ #category : #initialization }
LoadInsn >> initializeTy: aPtrTy ptr: anOperand [

	ty := aPtrTy.
	ptr := anOperand
]

{ #category : #printing }
LoadInsn >> printOn: aStream [

	aStream nextPutAll: 'load '.
	ty ty printOn: aStream.
	aStream nextPutAll: ', '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	ptr printOn: aStream
]
