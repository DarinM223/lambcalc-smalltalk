Class {
	#name : #LambcalcLamLamNode,
	#superclass : #LambcalcLamNode,
	#instVars : [
		'var',
		'body'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LambcalcLamLamNode >> alphaRenameWith: aDictionary [

	| newVar oldVar savedVar |
	oldVar := var var.
	newVar := oldVar , LambcalcTemp fresh printString.
	savedVar := aDictionary at: oldVar ifAbsent: [ nil ].
	aDictionary at: oldVar put: newVar.
	var var: newVar.
	body alphaRenameWith: aDictionary.
	aDictionary at: oldVar put: savedVar
]

{ #category : #'anf conversion' }
LambcalcLamLamNode >> anfConvertWith: aFullBlockClosure [

	| f t |
	f := 'f' , LambcalcTemp fresh printString.
	t := self body anfConvertWith: [ :val | LambcalcHaltAnfExp val: val ].
	^ LambcalcFunAnfExp
		  binding: f
		  params: { self var var }
		  body: t
		  rest: (aFullBlockClosure value: (LambcalcVarAnfValue var: f))
]

{ #category : #accessing }
LambcalcLamLamNode >> body [

	^ body
]

{ #category : #accessing }
LambcalcLamLamNode >> body: anObject [

	body := anObject
]

{ #category : #accessing }
LambcalcLamLamNode >> var [

	^ var
]

{ #category : #accessing }
LambcalcLamLamNode >> var: anObject [

	var := anObject
]
