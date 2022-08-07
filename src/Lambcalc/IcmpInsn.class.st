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

{ #category : #printing }
IcmpInsn >> printOn: aStream [

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
