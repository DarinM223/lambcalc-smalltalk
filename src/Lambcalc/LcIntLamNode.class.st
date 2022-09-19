Class {
	#name : #LcIntLamNode,
	#superclass : #LcLamNode,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LcIntLamNode >> anfConvertWith: aFullBlockClosure [

	^ aFullBlockClosure value: (LcIntAnfValue val: val)
]

{ #category : #accessing }
LcIntLamNode >> val [

	^ val
]

{ #category : #accessing }
LcIntLamNode >> val: anObject [

	val := anObject
]
