Class {
	#name : #LambcalcVoidTy,
	#superclass : #LambcalcTy,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcVoidTy >> printOn: aStream [

	aStream nextPutAll: 'void'
]
