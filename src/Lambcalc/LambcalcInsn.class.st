Class {
	#name : #LambcalcInsn,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcInsn >> printWithUid: aString on: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: aString;
		nextPutAll: ' = '.
	self printOn: aStream
]
