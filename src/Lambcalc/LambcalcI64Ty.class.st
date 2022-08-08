Class {
	#name : #LambcalcI64Ty,
	#superclass : #LambcalcTy,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcI64Ty >> printOn: aStream [

	aStream nextPutAll: 'i64'
]
