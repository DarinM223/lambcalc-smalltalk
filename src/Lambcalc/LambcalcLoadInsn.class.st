Class {
	#name : #LambcalcLoadInsn,
	#superclass : #LambcalcInsn,
	#instVars : [
		'ty',
		'ptr'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcLoadInsn class >> ty: aPtrTy ptr: anOperand [

	^ self new initializeTy: aPtrTy ptr: anOperand
]

{ #category : #initialization }
LambcalcLoadInsn >> initializeTy: aPtrTy ptr: anOperand [

	ty := aPtrTy.
	ptr := anOperand
]

{ #category : #printing }
LambcalcLoadInsn >> printOn: aStream [

	aStream nextPutAll: 'load '.
	ty ty printOn: aStream.
	aStream nextPutAll: ', '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	ptr printOn: aStream
]
