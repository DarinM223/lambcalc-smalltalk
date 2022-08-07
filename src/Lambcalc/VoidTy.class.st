Class {
	#name : #VoidTy,
	#superclass : #Ty,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
VoidTy >> printOn: aStream [

	aStream nextPutAll: 'void'
]
