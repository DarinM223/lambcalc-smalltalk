Class {
	#name : #LambcalcIntAnfValue,
	#superclass : #LambcalcAnfValue,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LambcalcIntAnfValue class >> val: anInteger [

	^ self new val: anInteger
]

{ #category : #'free variables' }
LambcalcIntAnfValue >> freeVarsWith: aSet [

	^ Set empty
]

{ #category : #'llvm lowering' }
LambcalcIntAnfValue >> lower [

	^ LambcalcConstOperand val: val
]

{ #category : #accessing }
LambcalcIntAnfValue >> val: anInteger [

	val := anInteger
]
