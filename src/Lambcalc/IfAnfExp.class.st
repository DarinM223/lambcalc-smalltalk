Class {
	#name : #IfAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'testValue',
		'trueExp',
		'falseExp'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #tests }
IfAnfExp class >> testValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	^ self new
		  initializeTestValue: anAnfValue
		  trueExp: anAnfExp
		  falseExp: anAnfExp2
]

{ #category : #'free variables' }
IfAnfExp >> freeVarsWith: aSet [

	^ ((testValue freeVarsWith: aSet) union: (trueExp freeVarsWith: aSet)) 
		  union: (falseExp freeVarsWith: aSet)
]

{ #category : #initialization }
IfAnfExp >> initializeTestValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	testValue := anAnfValue.
	trueExp := anAnfExp.
	falseExp := anAnfExp2
]
