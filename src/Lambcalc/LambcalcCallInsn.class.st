Class {
	#name : #LambcalcCallInsn,
	#superclass : #LambcalcInsn,
	#instVars : [
		'ty',
		'fun',
		'args'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcCallInsn class >> ty: aTy fun: anOperand args: aCollection [

	^ self new initializeTy: aTy fun: anOperand args: aCollection
]

{ #category : #'as yet unclassified' }
LambcalcCallInsn >> initializeTy: aTy fun: anOperand args: aCollection [

	ty := aTy.
	fun := anOperand.
	args := aCollection
]

{ #category : #printing }
LambcalcCallInsn >> printOn: aStream [

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
LambcalcCallInsn >> printWithUid: aString on: aStream [

	ty class == LambcalcVoidTy
		ifTrue: [ self printOn: aStream ]
		ifFalse: [ super printWithUid: aString on: aStream ]
]
