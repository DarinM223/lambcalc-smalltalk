Class {
	#name : #LambcalcVarAnfValue,
	#superclass : #LambcalcAnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LambcalcVarAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #'anf conversion' }
LambcalcVarAnfValue >> applyVal: aVarAnfValue andCont: aFullBlockClosure [

	| r |
	r := 'r' , LambcalcTemp fresh printString.
	^ LambcalcAppAnfExp
		  binding: r
		  funName: var
		  params: { aVarAnfValue }
		  rest: (aFullBlockClosure value: (LambcalcVarAnfValue var: r))
]

{ #category : #'free variables' }
LambcalcVarAnfValue >> freeVarsWith: aSet [

	^ (aSet includes: var)
		  ifTrue: [ Set empty ]
		  ifFalse: [ Set with: var ]
]

{ #category : #'llvm lowering' }
LambcalcVarAnfValue >> lower [

	^ LambcalcIdOperand var: var
]

{ #category : #accessing }
LambcalcVarAnfValue >> var: aString [

	var := aString
]
