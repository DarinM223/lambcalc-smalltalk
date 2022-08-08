Class {
	#name : #LambcalcBrTerminator,
	#superclass : #LambcalcTerminator,
	#instVars : [
		'label'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LambcalcBrTerminator class >> label: aString [

	^ self new label: aString
]

{ #category : #accessing }
LambcalcBrTerminator >> label: aString [ 
	label := aString
]

{ #category : #printing }
LambcalcBrTerminator >> printOn: aStream [

	aStream
		nextPutAll: 'br label %';
		nextPutAll: label
]
