Class {
	#name : #BrTerminator,
	#superclass : #Terminator,
	#instVars : [
		'label'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
BrTerminator class >> label: aString [

	^ self new label: aString
]

{ #category : #accessing }
BrTerminator >> label: aString [ 
	label := aString
]

{ #category : #printing }
BrTerminator >> printOn: aStream [

	aStream
		nextPutAll: 'br label %';
		nextPutAll: label
]
