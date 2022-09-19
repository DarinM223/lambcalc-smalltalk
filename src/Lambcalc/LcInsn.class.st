Class {
	#name : #LcInsn,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcInsn >> printWithUid: aString on: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: aString;
		nextPutAll: ' = '.
	self printOn: aStream
]
