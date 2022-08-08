Class {
	#name : #LambcalcTy,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcTy >> printWithGid: aString on: aStream [

	aStream
		nextPutAll: '@';
		nextPutAll: aString;
		nextPutAll: ' = external global '.
	self printOn: aStream
]
