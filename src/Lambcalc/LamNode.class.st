Class {
	#name : #LamNode,
	#superclass : #Object,
	#category : #'Lambcalc-Lambda'
}

{ #category : #printing }
LamNode >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self className;
		nextPutAll: ' new'.
	self class slots do: [ :slot | 
		aStream
			nextPutAll: ' ';
			nextPutAll: slot name;
			nextPutAll: ': '.
		(slot read: self) printOn: aStream.
		aStream nextPutAll: ';' ].
	aStream nextPutAll: ' yourself)'
]