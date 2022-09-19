Class {
	#name : #LcStoreInsn,
	#superclass : #LcInsn,
	#instVars : [
		'ty',
		'src',
		'dest'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcStoreInsn class >> ty: aTy src: anOperand1 dest: anOperand2 [

	^ self new initializeTy: aTy src: anOperand1 dest: anOperand2
]

{ #category : #'as yet unclassified' }
LcStoreInsn >> initializeTy: aTy src: anOperand1 dest: anOperand2 [

	ty := aTy.
	src := anOperand1.
	dest := anOperand2
]

{ #category : #printing }
LcStoreInsn >> printOn: aStream [

	aStream nextPutAll: 'store '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	src printOn: aStream.
	aStream nextPutAll: ', '.
	(LcPtrTy ty: ty) printOn: aStream.
	aStream nextPutAll: ' '.
	dest printOn: aStream
]

{ #category : #printing }
LcStoreInsn >> printWithUid: aString on: aStream [

	self printOn: aStream
]
