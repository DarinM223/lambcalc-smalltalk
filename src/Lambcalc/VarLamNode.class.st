Class {
	#name : #VarLamNode,
	#superclass : #LamNode,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
VarLamNode >> alphaRenameWith: aDictionary [

	(aDictionary includesKey: var)
		ifTrue: [ self var: (aDictionary at: var) ]
		ifFalse: [ self error: var , ' not in scope' ]
]

{ #category : #'anf conversion' }
VarLamNode >> anfConvertWith: aFullBlockClosure [

	^ aFullBlockClosure value: (VarAnfValue var: self var)
]

{ #category : #accessing }
VarLamNode >> var [

	^ var
]

{ #category : #accessing }
VarLamNode >> var: anObject [

	var := anObject
]
