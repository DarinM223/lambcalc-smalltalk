Class {
	#name : #LcBrTerminator,
	#superclass : #LcTerminator,
	#instVars : [
		'label'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcBrTerminator class >> label: aString [

	^ self new label: aString
]

{ #category : #accessing }
LcBrTerminator >> label: aString [ 
	label := aString
]

{ #category : #printing }
LcBrTerminator >> printOn: aStream [

	aStream
		nextPutAll: 'br label %';
		nextPutAll: label
]
