Class {
	#name : #LcIntAnfValue,
	#superclass : #LcAnfValue,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LcIntAnfValue class >> val: anInteger [

	^ self new val: anInteger
]

{ #category : #'free variables' }
LcIntAnfValue >> freeVarsWith: aSet [

	^ Set empty
]

{ #category : #'llvm lowering' }
LcIntAnfValue >> lower [

	^ LcConstOperand val: val
]

{ #category : #accessing }
LcIntAnfValue >> val: anInteger [

	val := anInteger
]
