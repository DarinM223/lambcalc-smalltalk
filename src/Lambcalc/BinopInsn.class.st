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
		  initializeOp: anOp
		  ty: aTy
		  left: anOperand
		  right: anOperand2
]

{ #category : #'as yet unclassified' }
BinopInsn >> initializeOp: anOp ty: aTy left: anOperand right: anOperand2 [

	op := anOp.
	ty := aTy.
	left := anOperand.
	right := anOperand2
]

{ #category : #printing }
BinopInsn >> printOn: aStream [

	aStream
		nextPutAll: op opString;
		nextPutAll: ' '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	left printOn: aStream.
	aStream nextPutAll: ', '.
	right printOn: aStream
]
