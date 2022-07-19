Class {
	#name : #IntAnfValue,
	#superclass : #AnfValue,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
IntAnfValue class >> val: anInteger [

	^ self new val: anInteger
]

{ #category : #'free variables' }
IntAnfValue >> freeVarsWith: aSet [

	^ Set empty
]

{ #category : #accessing }
IntAnfValue >> val: anInteger [

	val := anInteger
]
