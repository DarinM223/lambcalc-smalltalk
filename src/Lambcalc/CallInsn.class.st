Class {
	#name : #CallInsn,
	#superclass : #Insn,
	#instVars : [
		'ty',
		'fun',
		'args'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
CallInsn class >> ty: aTy fun: anOperand args: aCollection [

	^ self new ty: aTy fun: anOperand args: aCollection
]

{ #category : #'as yet unclassified' }
CallInsn >> ty: aTy fun: anOperand args: aCollection [

	ty := aTy.
	fun := anOperand.
	args := aCollection
]
