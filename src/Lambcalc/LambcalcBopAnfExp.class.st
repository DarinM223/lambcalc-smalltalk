Class {
	#name : #LambcalcBopAnfExp,
	#superclass : #LambcalcAnfExp,
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
LambcalcBopAnfExp class >> binding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  op: aClass
		  left: anAnfValue
		  right: anAnfValue2
		  rest: anAnfExp
]

{ #category : #'free variables' }
LambcalcBopAnfExp >> freeVarsWith: aSet [

	| leftFreeVars rightFreeVars restFreeVars |
	leftFreeVars := left freeVarsWith: aSet.
	rightFreeVars := right freeVarsWith: aSet.
	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ (leftFreeVars union: rightFreeVars) union: restFreeVars
]

{ #category : #initialization }
LambcalcBopAnfExp >> initializeBinding: aString op: aClass left: anAnfValue right: anAnfValue2 rest: anAnfExp [

	binding := aString.
	op := aClass.
	left := anAnfValue.
	right := anAnfValue2.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LambcalcBopAnfExp >> lowerWith: lower [

	lower instrs add: { 
			binding.
			(LambcalcBinopInsn
				 op: op
				 ty: LambcalcI64Ty new
				 left: left lower
				 right: right lower) }.
	rest lowerWith: lower
]
