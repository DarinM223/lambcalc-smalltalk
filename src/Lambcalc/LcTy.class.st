Class {
	#name : #LcTy,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcTy >> printWithGid: aString on: aStream [

	aStream
		nextPutAll: '@';
		nextPutAll: aString;
		nextPutAll: ' = external global '.
	self printOn: aStream
]
