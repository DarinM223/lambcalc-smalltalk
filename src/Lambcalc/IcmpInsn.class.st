Class {
	#name : #IcmpInsn,
	#superclass : #Insn,
	#instVars : [
		'cnd',
		'ty',
		'left',
		'right'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
IcmpInsn class >> cnd: aString ty: aTy left: anOperand right: anOperand2 [

	^ self new
		  cnd: aString
		  ty: aTy
		  left: anOperand
		  right: anOperand2
]

{ #category : #'as yet unclassified' }
IcmpInsn >> cnd: aString ty: aTy left: anOperand right: anOperand2 [

	cnd := aString.
	ty := aTy.
	left := anOperand.
	right := anOperand2
]
