Class {
	#name : #AllocaInsn,
	#superclass : #Insn,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
AllocaInsn class >> ty: aTy [

	^ self new ty: aTy
]

{ #category : #printing }
AllocaInsn >> printOn: aStream [

	aStream nextPutAll: 'alloca '.
	ty printOn: aStream
]

{ #category : #accessing }
AllocaInsn >> ty: aTy [

	ty := aTy
]
