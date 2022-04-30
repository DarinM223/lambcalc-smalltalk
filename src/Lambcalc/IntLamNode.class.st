Class {
	#name : #IntLamNode,
	#superclass : #LamNode,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #accessing }
IntLamNode >> val [

	^ val
]

{ #category : #accessing }
IntLamNode >> val: anObject [

	val := anObject
]
