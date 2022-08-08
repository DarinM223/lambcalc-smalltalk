Class {
	#name : #LambcalcNamedtTy,
	#superclass : #LambcalcTy,
	#instVars : [
		'tid'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcNamedtTy >> printOn: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: tid
]
