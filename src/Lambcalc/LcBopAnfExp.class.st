Class {
	#name : #LcBopAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'binding',
		'op',
		'left',
		'right',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcBopAnfExp class >> binding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  op: aClass
		  left: anAnfValue
		  right: anAnfValue2
		  rest: anAnfExp
]

{ #category : #'free variables' }
LcBopAnfExp >> freeVarsWith: aSet [

	| leftFreeVars rightFreeVars restFreeVars |
	leftFreeVars := left freeVarsWith: aSet.
	rightFreeVars := right freeVarsWith: aSet.
	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ (leftFreeVars union: rightFreeVars) union: restFreeVars
]

{ #category : #initialization }
LcBopAnfExp >> initializeBinding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	binding := aString.
	op := aClass.
	left := anAnfValue.
	right := anAnfValue2.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LcBopAnfExp >> lowerWith: lower [

	lower instrs add: { 
			binding.
			(LcBinopInsn
				 op: op
				 ty: LcI64Ty new
				 left: left lower
				 right: right lower) }.
	rest lowerWith: lower
]
