Class {
	#name : #LcIcmpInsn,
	#superclass : #LcInsn,
	#instVars : [
		'cnd',
		'ty',
		'left',
		'right'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcIcmpInsn class >> cnd: aString ty: aTy left: anOperand right: anOperand2 [

	^ self new
		  initializeCnd: aString
		  ty: aTy
		  left: anOperand
		  right: anOperand2
]

{ #category : #'as yet unclassified' }
LcIcmpInsn >> initializeCnd: aString ty: aTy left: anOperand right: anOperand2 [

	cnd := aString.
	ty := aTy.
	left := anOperand.
	right := anOperand2
]

{ #category : #printing }
LcIcmpInsn >> printOn: aStream [

	aStream
		nextPutAll: 'icmp ';
		nextPutAll: cnd;
		nextPutAll: ' '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	left printOn: aStream.
	aStream nextPutAll: ', '.
	right printOn: aStream
]
