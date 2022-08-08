Class {
	#name : #LambcalcBopLamNode,
	#superclass : #LambcalcLamNode,
	#instVars : [
		'op',
		'left',
		'right'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LambcalcBopLamNode >> anfConvertWith: aFullBlockClosure [

	| r |
	^ self left anfConvertWith: [ :leftVal | 
		self right anfConvertWith: [ :rightVal | 
			r := 'r' , LambcalcTemp fresh printString.
			LambcalcBopAnfExp
				binding: r
				op: self op
				left: leftVal
				right: rightVal
				rest: (aFullBlockClosure value: (LambcalcVarAnfValue var: r)) ] ]
]

{ #category : #accessing }
LambcalcBopLamNode >> left [

	^ left
]

{ #category : #accessing }
LambcalcBopLamNode >> left: anObject [

	left := anObject
]

{ #category : #accessing }
LambcalcBopLamNode >> op [

	^ op
]

{ #category : #accessing }
LambcalcBopLamNode >> op: anObject [

	op := anObject
]

{ #category : #accessing }
LambcalcBopLamNode >> right [

	^ right
]

{ #category : #accessing }
LambcalcBopLamNode >> right: anObject [

	right := anObject
]
