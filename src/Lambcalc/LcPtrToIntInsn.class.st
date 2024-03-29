Class {
	#name : #LcPtrToIntInsn,
	#superclass : #LcInsn,
	#instVars : [
		'ty1',
		'ptr',
		'ty2'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcPtrToIntInsn class >> ty1: aTy ptr: anOperand ty2: aTy2 [

	^ self new initializeTy1: aTy ptr: anOperand ty2: aTy2
]

{ #category : #'as yet unclassified' }
LcPtrToIntInsn >> initializeTy1: aTy1 ptr: anOperand ty2: aTy2 [

	ty1 := aTy1.
	ptr := anOperand.
	ty2 := aTy2
]

{ #category : #printing }
LcPtrToIntInsn >> printOn: aStream [

	aStream nextPutAll: 'ptrtoint '.
	ty1 printOn: aStream.
	aStream nextPutAll: ' '.
	ptr printOn: aStream.
	aStream nextPutAll: ' to '.
	ty2 printOn: aStream
]
