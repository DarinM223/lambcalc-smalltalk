Class {
	#name : #BopLamNode,
	#superclass : #LamNode,
	#instVars : [
		'op',
		'left',
		'right'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
BopLamNode >> anfConvertWith: aFullBlockClosure [

	| r |
	^ self left anfConvertWith: [ :leftVal | 
		self right anfConvertWith: [ :rightVal | 
			r := 'r' , Temp fresh printString.
			BopAnfExp
				binding: r
				op: self op
				left: leftVal
				right: rightVal
				rest: (aFullBlockClosure value: (VarAnfValue var: r)) ] ]
]

{ #category : #accessing }
BopLamNode >> left [

	^ left
]

{ #category : #accessing }
BopLamNode >> left: anObject [

	left := anObject
]

{ #category : #accessing }
BopLamNode >> op [

	^ op
]

{ #category : #accessing }
BopLamNode >> op: anObject [

	op := anObject
]

{ #category : #accessing }
BopLamNode >> right [

	^ right
]

{ #category : #accessing }
BopLamNode >> right: anObject [

	right := anObject
]
