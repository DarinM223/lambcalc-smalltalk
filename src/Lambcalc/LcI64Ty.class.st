Class {
	#name : #LcI64Ty,
	#superclass : #LcTy,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcI64Ty >> printOn: aStream [

	aStream nextPutAll: 'i64'
]
