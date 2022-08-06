Class {
	#name : #HaltAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
HaltAnfExp class >> val: anAnfValue [

	^ self new val: anAnfValue
]

{ #category : #'free variables' }
HaltAnfExp >> freeVarsWith: aSet [

	^ val freeVarsWith: aSet
]

{ #category : #'llvm lowering' }
HaltAnfExp >> lowerWith: lower [

	lower last: (RetTerminator ty: I64Ty new val: val lower)
]

{ #category : #accessing }
HaltAnfExp >> val: anAnfValue [

	val := anAnfValue
]
