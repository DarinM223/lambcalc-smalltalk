Class {
	#name : #AnfValue,
	#superclass : #Object,
	#category : #'Lambcalc-Anf'
}

{ #category : #printing }
AnfValue >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self className.
	self class slots do: [ :slot | 
		aStream
			nextPutAll: ' ';
			nextPutAll: slot name;
			nextPutAll: ': '.
		(slot read: self) printOn: aStream.
		aStream nextPutAll: ' ' ].
	aStream nextPutAll: ')'
]

{ #category : #asserting }
AnfValue >> shouldBePrintedAsLiteral [

	^ true
]
