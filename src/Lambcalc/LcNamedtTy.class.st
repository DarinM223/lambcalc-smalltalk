Class {
	#name : #LcNamedtTy,
	#superclass : #LcTy,
	#instVars : [
		'tid'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcNamedtTy >> printOn: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: tid
]
