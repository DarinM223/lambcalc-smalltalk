Class {
	#name : #LambcalcAllocaInsn,
	#superclass : #LambcalcInsn,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LambcalcAllocaInsn class >> ty: aTy [

	^ self new ty: aTy
]

{ #category : #printing }
LambcalcAllocaInsn >> printOn: aStream [

	aStream nextPutAll: 'alloca '.
	ty printOn: aStream
]

{ #category : #accessing }
LambcalcAllocaInsn >> ty: aTy [

	ty := aTy
]
