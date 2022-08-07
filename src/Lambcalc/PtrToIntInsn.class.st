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

{ #category : #printing }
PtrToIntInsn >> printOn: aStream [

	aStream nextPutAll: 'ptrtoint '.
	ty1 printOn: aStream.
	aStream nextPutAll: ' '.
	ptr printOn: aStream.
	aStream nextPutAll: ' to '.
	ty2 printOn: aStream
]

{ #category : #'as yet unclassified' }
PtrToIntInsn >> ty1: aTy1 ptr: anOperand ty2: aTy2 [

	ty1 := aTy1.
	ptr := anOperand.
	ty2 := aTy2
]
