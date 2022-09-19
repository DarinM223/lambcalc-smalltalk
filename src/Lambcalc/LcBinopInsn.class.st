Class {
	#name : #LcBinopInsn,
	#superclass : #LcInsn,
	#instVars : [
		'op',
		'ty',
		'left',
		'right'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcBinopInsn class >> op: anOp ty: aTy left: anOperand right: anOperand2 [

	^ self new
		  initializeOp: anOp
		  ty: aTy
		  left: anOperand
		  right: anOperand2
]

{ #category : #'as yet unclassified' }
LcBinopInsn >> initializeOp: anOp ty: aTy left: anOperand right: anOperand2 [

	op := anOp.
	ty := aTy.
	left := anOperand.
	right := anOperand2
]

{ #category : #printing }
LcBinopInsn >> printOn: aStream [

	aStream
		nextPutAll: op opString;
		nextPutAll: ' '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	left printOn: aStream.
	aStream nextPutAll: ', '.
	right printOn: aStream
]
