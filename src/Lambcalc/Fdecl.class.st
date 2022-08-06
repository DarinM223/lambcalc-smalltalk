Class {
	#name : #Fdecl,
	#superclass : #Object,
	#instVars : [
		'fty',
		'params',
		'cfg'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
Fdecl class >> fty: aCollection params: aCollection2 cfg: aCfg [

	^ self new fty: aCollection params: aCollection2 cfg: aCfg
]

{ #category : #'as yet unclassified' }
Fdecl >> fty: aCollection params: aCollection2 cfg: aCfg [

	fty := aCollection.
	params := aCollection2.
	cfg := aCfg
]
