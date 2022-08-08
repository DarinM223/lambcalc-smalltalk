Class {
	#name : #LambcalcStoreInsn,
	#superclass : #LambcalcInsn,
	#instVars : [
		'ty',
		'src',
		'dest'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcStoreInsn class >> ty: aTy src: anOperand1 dest: anOperand2 [

	^ self new initializeTy: aTy src: anOperand1 dest: anOperand2
]

{ #category : #'as yet unclassified' }
LambcalcStoreInsn >> initializeTy: aTy src: anOperand1 dest: anOperand2 [

	ty := aTy.
	src := anOperand1.
	dest := anOperand2
]

{ #category : #printing }
LambcalcStoreInsn >> printOn: aStream [

	aStream nextPutAll: 'store '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	src printOn: aStream.
	aStream nextPutAll: ', '.
	(LambcalcPtrTy ty: ty) printOn: aStream.
	aStream nextPutAll: ' '.
	dest printOn: aStream
]

{ #category : #printing }
LambcalcStoreInsn >> printWithUid: aString on: aStream [

	self printOn: aStream
]
