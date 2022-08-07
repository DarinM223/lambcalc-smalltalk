Class {
	#name : #Ty,
	#superclass : #Object,
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
Ty >> printWithGid: aString on: aStream [

	aStream
		nextPutAll: '@';
		nextPutAll: aString;
		nextPutAll: ' = external global '.
	self printOn: aStream
]
