Class {
	#name : #BopLamNode,
	#superclass : #LamNode,
	#instVars : [
		'op',
		'left',
		'right'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #accessing }
BopLamNode >> left [

	^ left
]

{ #category : #accessing }
BopLamNode >> left: anObject [

	left := anObject
]

{ #category : #accessing }
BopLamNode >> op [

	^ op
]

{ #category : #accessing }
BopLamNode >> op: anObject [

	op := anObject
]

{ #category : #accessing }
BopLamNode >> right [

	^ right
]

{ #category : #accessing }
BopLamNode >> right: anObject [

	right := anObject
]
