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

{ #category : #'llvm lowering' }
IntAnfValue >> lower [

	^ ConstOperand val: val
]

{ #category : #accessing }
IntAnfValue >> val: anInteger [

	val := anInteger
]
