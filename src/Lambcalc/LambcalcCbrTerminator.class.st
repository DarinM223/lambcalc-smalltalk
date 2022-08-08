Class {
	#name : #LambcalcCbrTerminator,
	#superclass : #LambcalcTerminator,
	#instVars : [
		'val',
		'then',
		'else'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcCbrTerminator class >> val: anOperand then: aString else: aString2 [

	^ self new initializeVal: anOperand then: aString else: aString2
]

{ #category : #'as yet unclassified' }
LambcalcCbrTerminator >> initializeVal: anOperand then: aString else: aString2 [

	val := anOperand.
	then := aString.
	else := aString2
]

{ #category : #printing }
LambcalcCbrTerminator >> printOn: aStream [

	aStream nextPutAll: 'br i1 '.
	val printOn: aStream.
	aStream
		nextPutAll: ', label %';
		nextPutAll: then;
		nextPutAll: ', label %';
		nextPutAll: else
]
