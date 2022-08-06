Class {
	#name : #CbrTerminator,
	#superclass : #Terminator,
	#instVars : [
		'val',
		'then',
		'else'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
CbrTerminator class >> val: anOperand then: aString else: aString2 [

	^ self new val: anOperand then: aString else: aString2
]

{ #category : #'as yet unclassified' }
CbrTerminator >> val: anOperand then: aString else: aString2 [

	val := anOperand.
	then := aString.
	else := aString2
]
