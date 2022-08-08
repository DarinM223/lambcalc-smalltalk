Class {
	#name : #LambcalcIntLamNode,
	#superclass : #LambcalcLamNode,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LambcalcIntLamNode >> anfConvertWith: aFullBlockClosure [

	^ aFullBlockClosure value: (LambcalcIntAnfValue val: val)
]

{ #category : #accessing }
LambcalcIntLamNode >> val [

	^ val
]

{ #category : #accessing }
LambcalcIntLamNode >> val: anObject [

	val := anObject
]
