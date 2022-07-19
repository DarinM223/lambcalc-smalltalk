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

{ #category : #accessing }
HaltAnfExp >> val: anAnfValue [

	val := anAnfValue
]
