Class {
	#name : #LcLoadInsn,
	#superclass : #LcInsn,
	#instVars : [
		'ty',
		'ptr'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcLoadInsn class >> ty: aPtrTy ptr: anOperand [

	^ self new initializeTy: aPtrTy ptr: anOperand
]

{ #category : #initialization }
LcLoadInsn >> initializeTy: aPtrTy ptr: anOperand [

	ty := aPtrTy.
	ptr := anOperand
]

{ #category : #printing }
LcLoadInsn >> printOn: aStream [

	aStream nextPutAll: 'load '.
	ty ty printOn: aStream.
	aStream nextPutAll: ', '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	ptr printOn: aStream
]
