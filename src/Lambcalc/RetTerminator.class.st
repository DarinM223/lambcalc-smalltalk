Class {
	#name : #RetTerminator,
	#superclass : #Terminator,
	#instVars : [
		'ty',
		'val'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
RetTerminator class >> ty: aTy val: anOperand [

	^ self new ty: aTy val: anOperand
]

{ #category : #'as yet unclassified' }
RetTerminator >> ty: aTy val: anOperand [

	ty := aTy.
	val := anOperand
]
