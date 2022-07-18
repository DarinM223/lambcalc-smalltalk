Class {
	#name : #IntLamNode,
	#superclass : #LamNode,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
IntLamNode >> anfConvertWith: aFullBlockClosure [

	^ aFullBlockClosure value: (IntAnfValue val: val)
]

{ #category : #accessing }
IntLamNode >> val [

	^ val
]

{ #category : #accessing }
IntLamNode >> val: anObject [

	val := anObject
]
