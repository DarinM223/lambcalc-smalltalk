Class {
	#name : #LcHaltAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LcHaltAnfExp class >> val: anAnfValue [

	^ self new val: anAnfValue
]

{ #category : #'free variables' }
LcHaltAnfExp >> freeVarsWith: aSet [

	^ val freeVarsWith: aSet
]

{ #category : #'llvm lowering' }
LcHaltAnfExp >> lowerWith: lower [

	lower last: (LcRetTerminator ty: LcI64Ty new val: val lower)
]

{ #category : #accessing }
LcHaltAnfExp >> val: anAnfValue [

	val := anAnfValue
]
