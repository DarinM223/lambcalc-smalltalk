Class {
	#name : #LambcalcHaltAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LambcalcHaltAnfExp class >> val: anAnfValue [

	^ self new val: anAnfValue
]

{ #category : #'free variables' }
LambcalcHaltAnfExp >> freeVarsWith: aSet [

	^ val freeVarsWith: aSet
]

{ #category : #'llvm lowering' }
LambcalcHaltAnfExp >> lowerWith: lower [

	lower last: (LambcalcRetTerminator ty: LambcalcI64Ty new val: val lower)
]

{ #category : #accessing }
LambcalcHaltAnfExp >> val: anAnfValue [

	val := anAnfValue
]
