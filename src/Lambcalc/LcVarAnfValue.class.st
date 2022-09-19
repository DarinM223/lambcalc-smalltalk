Class {
	#name : #LcVarAnfValue,
	#superclass : #LcAnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
LcVarAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #'anf conversion' }
LcVarAnfValue >> applyVal: aVarAnfValue andCont: aFullBlockClosure [

	| r |
	r := 'r' , LcTemp fresh printString.
	^ LcAppAnfExp
		  binding: r
		  funName: var
		  params: { aVarAnfValue }
		  rest: (aFullBlockClosure value: (LcVarAnfValue var: r))
]

{ #category : #'free variables' }
LcVarAnfValue >> freeVarsWith: aSet [

	^ (aSet includes: var)
		  ifTrue: [ Set empty ]
		  ifFalse: [ Set with: var ]
]

{ #category : #'llvm lowering' }
LcVarAnfValue >> lower [

	^ LcIdOperand var: var
]

{ #category : #accessing }
LcVarAnfValue >> var: aString [

	var := aString
]
