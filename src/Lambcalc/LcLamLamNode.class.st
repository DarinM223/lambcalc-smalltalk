Class {
	#name : #LcLamLamNode,
	#superclass : #LcLamNode,
	#instVars : [
		'var',
		'body'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LcLamLamNode >> alphaRenameWith: aDictionary [

	| newVar oldVar savedVar |
	oldVar := var var.
	newVar := oldVar , LcTemp fresh printString.
	savedVar := aDictionary at: oldVar ifAbsent: [ nil ].
	aDictionary at: oldVar put: newVar.
	var var: newVar.
	body alphaRenameWith: aDictionary.
	aDictionary at: oldVar put: savedVar
]

{ #category : #'anf conversion' }
LcLamLamNode >> anfConvertWith: aFullBlockClosure [

	| f t |
	f := 'f' , LcTemp fresh printString.
	t := self body anfConvertWith: [ :val | LcHaltAnfExp val: val ].
	^ LcFunAnfExp
		  binding: f
		  params: { self var var }
		  body: t
		  rest: (aFullBlockClosure value: (LcVarAnfValue var: f))
]

{ #category : #accessing }
LcLamLamNode >> body [

	^ body
]

{ #category : #accessing }
LcLamLamNode >> body: anObject [

	body := anObject
]

{ #category : #accessing }
LcLamLamNode >> var [

	^ var
]

{ #category : #accessing }
LcLamLamNode >> var: anObject [

	var := anObject
]
