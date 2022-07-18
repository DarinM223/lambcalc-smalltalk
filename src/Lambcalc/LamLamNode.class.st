Class {
	#name : #LamLamNode,
	#superclass : #LamNode,
	#instVars : [
		'var',
		'body'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LamLamNode >> alphaRenameWith: aDictionary [

	| newVar oldVar savedVar |
	oldVar := var var.
	newVar := oldVar , Temp fresh printString.
	savedVar := aDictionary at: oldVar ifAbsent: [ nil ].
	aDictionary at: oldVar put: newVar.
	var var: newVar.
	body alphaRenameWith: aDictionary.
	aDictionary at: oldVar put: savedVar
]

{ #category : #'anf conversion' }
LamLamNode >> anfConvertWith: aFullBlockClosure [

	| f t |
	f := 'f' , Temp fresh printString.
	t := self body anfConvertWith: [ :val | HaltAnfExp val: val ].
	^ FunAnfExp
		  binding: f
		  params: { self var var }
		  body: t
		  rest: (aFullBlockClosure value: (VarAnfValue var: f))
]

{ #category : #accessing }
LamLamNode >> body [

	^ body
]

{ #category : #accessing }
LamLamNode >> body: anObject [

	body := anObject
]

{ #category : #accessing }
LamLamNode >> var [

	^ var
]

{ #category : #accessing }
LamLamNode >> var: anObject [

	var := anObject
]
