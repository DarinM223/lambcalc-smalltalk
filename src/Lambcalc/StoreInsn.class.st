Class {
	#name : #StoreInsn,
	#superclass : #Insn,
	#instVars : [
		'ty',
		'src',
		'dest'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
StoreInsn class >> ty: aTy src: anOperand1 dest: anOperand2 [

	^ self new initializeTy: aTy src: anOperand1 dest: anOperand2
]

{ #category : #'as yet unclassified' }
StoreInsn >> initializeTy: aTy src: anOperand1 dest: anOperand2 [

	ty := aTy.
	src := anOperand1.
	dest := anOperand2
]

{ #category : #printing }
StoreInsn >> printOn: aStream [

	aStream nextPutAll: 'store '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	src printOn: aStream.
	aStream nextPutAll: ', '.
	(PtrTy ty: ty) printOn: aStream.
	aStream nextPutAll: ' '.
	dest printOn: aStream
]

{ #category : #printing }
StoreInsn >> printWithUid: aString on: aStream [

	self printOn: aStream
]
