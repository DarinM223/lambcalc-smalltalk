Class {
	#name : #LcVarLamNode,
	#superclass : #LcLamNode,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LcVarLamNode >> alphaRenameWith: aDictionary [

	(aDictionary includesKey: var)
		ifTrue: [ self var: (aDictionary at: var) ]
		ifFalse: [ self error: var , ' not in scope' ]
]

{ #category : #'anf conversion' }
LcVarLamNode >> anfConvertWith: aFullBlockClosure [

	^ aFullBlockClosure value: (LcVarAnfValue var: self var)
]

{ #category : #accessing }
LcVarLamNode >> var [

	^ var
]

{ #category : #accessing }
LcVarLamNode >> var: anObject [

	var := anObject
]
