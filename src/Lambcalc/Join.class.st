Class {
	#name : #Join,
	#superclass : #Object,
	#instVars : [
		'binding',
		'valueBinding',
		'body'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
Join class >> binding: aString valueBinding: aString2 body: anAnfExp [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
]

{ #category : #initialization }
Join >> initializeBinding: aString valueBinding: aString2 body: anAnfExp [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp
]

{ #category : #printing }
Join >> printOn: aStream [

	| slotValue |
	aStream
		nextPutAll: '(';
		nextPutAll: self className.
	self class slots do: [ :slot | 
		aStream
			nextPutAll: ' ';
			nextPutAll: slot name;
			nextPutAll: ': '.
		slotValue := slot read: self.
		slotValue printOn: aStream ].
	aStream nextPutAll: ')'
]
