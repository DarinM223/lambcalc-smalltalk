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

	^ self new ty: aTy src: anOperand1 dest: anOperand2
]

{ #category : #'as yet unclassified' }
StoreInsn >> ty: aTy src: anOperand1 dest: anOperand2 [

	ty := aTy.
	src := anOperand1.
	dest := anOperand2
]
