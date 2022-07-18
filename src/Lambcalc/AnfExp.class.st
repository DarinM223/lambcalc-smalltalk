Class {
	#name : #AnfExp,
	#superclass : #Object,
	#category : #'Lambcalc-Anf'
}

{ #category : #printing }
AnfExp >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self className;
		nextPutAll: ' '.
	self class slots do: [ :slot | 
		aStream
			nextPutAll: ' ';
			nextPutAll: slot name;
			nextPutAll: ': '.
		(slot read: self) printOn: aStream.
		aStream nextPutAll: ' ' ].
	aStream nextPutAll: ')'
]
