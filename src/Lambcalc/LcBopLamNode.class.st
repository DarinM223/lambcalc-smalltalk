Class {
	#name : #LcBopLamNode,
	#superclass : #LcLamNode,
	#instVars : [
		'op',
		'left',
		'right'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LcBopLamNode >> anfConvertWith: aFullBlockClosure [

	| r |
	^ self left anfConvertWith: [ :leftVal | 
		self right anfConvertWith: [ :rightVal | 
			r := 'r' , LcTemp fresh printString.
			LcBopAnfExp
				binding: r
				op: self op
				left: leftVal
				right: rightVal
				rest: (aFullBlockClosure value: (LcVarAnfValue var: r)) ] ]
]

{ #category : #accessing }
LcBopLamNode >> left [

	^ left
]

{ #category : #accessing }
LcBopLamNode >> left: anObject [

	left := anObject
]

{ #category : #accessing }
LcBopLamNode >> op [

	^ op
]

{ #category : #accessing }
LcBopLamNode >> op: anObject [

	op := anObject
]

{ #category : #accessing }
LcBopLamNode >> right [

	^ right
]

{ #category : #accessing }
LcBopLamNode >> right: anObject [

	right := anObject
]
