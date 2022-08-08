Class {
	#name : #LambcalcVarLamNode,
	#superclass : #LambcalcLamNode,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LambcalcVarLamNode >> alphaRenameWith: aDictionary [

	(aDictionary includesKey: var)
		ifTrue: [ self var: (aDictionary at: var) ]
		ifFalse: [ self error: var , ' not in scope' ]
]

{ #category : #'anf conversion' }
LambcalcVarLamNode >> anfConvertWith: aFullBlockClosure [

	^ aFullBlockClosure value: (LambcalcVarAnfValue var: self var)
]

{ #category : #accessing }
LambcalcVarLamNode >> var [

	^ var
]

{ #category : #accessing }
LambcalcVarLamNode >> var: anObject [

	var := anObject
]
