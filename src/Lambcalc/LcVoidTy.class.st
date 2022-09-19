Class {
	#name : #LcVoidTy,
	#superclass : #LcTy,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcVoidTy >> printOn: aStream [

	aStream nextPutAll: 'void'
]
