Class {
	#name : #NamedtTy,
	#superclass : #Ty,
	#instVars : [
		'tid'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
NamedtTy >> printOn: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: tid
]
