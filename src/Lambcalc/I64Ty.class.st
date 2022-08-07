Class {
	#name : #I64Ty,
	#superclass : #Ty,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
I64Ty >> printOn: aStream [

	aStream nextPutAll: 'i64'
]
