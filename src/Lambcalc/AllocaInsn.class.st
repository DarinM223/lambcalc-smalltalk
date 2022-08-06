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

{ #category : #accessing }
AllocaInsn >> ty: aTy [

	ty := aTy
]
