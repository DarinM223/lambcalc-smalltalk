Class {
	#name : #LcCallInsn,
	#superclass : #LcInsn,
	#instVars : [
		'ty',
		'fun',
		'args'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcCallInsn class >> ty: aTy fun: anOperand args: aCollection [

	^ self new initializeTy: aTy fun: anOperand args: aCollection
]

{ #category : #'as yet unclassified' }
LcCallInsn >> initializeTy: aTy fun: anOperand args: aCollection [

	ty := aTy.
	fun := anOperand.
	args := aCollection
]

{ #category : #printing }
LcCallInsn >> printOn: aStream [

	aStream nextPutAll: 'call '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	fun printOn: aStream.
	aStream nextPutAll: '('.
	args
		do: [ :tuple | 
			(tuple at: 1) printOn: aStream.
			aStream nextPutAll: ' '.
			(tuple at: 2) printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ')'
]

{ #category : #printing }
LcCallInsn >> printWithUid: aString on: aStream [

	ty class == LcVoidTy
		ifTrue: [ self printOn: aStream ]
		ifFalse: [ super printWithUid: aString on: aStream ]
]
