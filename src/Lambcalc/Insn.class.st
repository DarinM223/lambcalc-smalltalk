Class {
	#name : #Insn,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
Insn >> printWithUid: aString on: aStream [

	aStream
		nextPutAll: '%';
		nextPutAll: aString;
		nextPutAll: ' = '.
	self printOn: aStream
]
