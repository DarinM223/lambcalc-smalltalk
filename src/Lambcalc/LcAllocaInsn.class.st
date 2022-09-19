Class {
	#name : #LcAllocaInsn,
	#superclass : #LcInsn,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcAllocaInsn class >> ty: aTy [

	^ self new ty: aTy
]

{ #category : #printing }
LcAllocaInsn >> printOn: aStream [

	aStream nextPutAll: 'alloca '.
	ty printOn: aStream
]

{ #category : #accessing }
LcAllocaInsn >> ty: aTy [

	ty := aTy
]
