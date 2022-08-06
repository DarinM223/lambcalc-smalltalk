Class {
	#name : #BinopInsn,
	#superclass : #Insn,
	#instVars : [
		'op',
		'ty',
		'left',
		'right'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
BinopInsn class >> op: anOp ty: aTy left: anOperand right: anOperand2 [

	^ self new
		  op: anOp
		  ty: aTy
		  left: anOperand
		  right: anOperand2
]

{ #category : #'as yet unclassified' }
BinopInsn >> op: anOp ty: aTy left: anOperand right: anOperand2 [

	op := anOp.
	ty := aTy.
	left := anOperand.
	right := anOperand2
]
