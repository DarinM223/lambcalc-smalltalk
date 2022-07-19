Class {
	#name : #VarAnfValue,
	#superclass : #AnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
VarAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #'anf conversion' }
VarAnfValue >> applyVal: aVarAnfValue andCont: aFullBlockClosure [

	| r |
	r := 'r' , Temp fresh printString.
	^ AppAnfExp
		  binding: r
		  funName: var
		  params: { aVarAnfValue }
		  rest: (aFullBlockClosure value: (VarAnfValue var: r))
]

{ #category : #'free variables' }
VarAnfValue >> freeVarsWith: aSet [

	^ (aSet includes: var)
		  ifTrue: [ Set empty ]
		  ifFalse: [ Set with: var ]
]

{ #category : #accessing }
VarAnfValue >> var: aString [

	var := aString
]
