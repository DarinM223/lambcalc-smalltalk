Class {
	#name : #LambcalcAppLamNode,
	#superclass : #LambcalcLamNode,
	#instVars : [
		'lam',
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LambcalcAppLamNode >> anfConvertWith: aFullBlockClosure [

	^ self lam anfConvertWith: [ :f | 
		  self val anfConvertWith: [ :x | 
			  f applyVal: x andCont: aFullBlockClosure ] ]
]

{ #category : #accessing }
LambcalcAppLamNode >> lam [

	^ lam
]

{ #category : #accessing }
LambcalcAppLamNode >> lam: anObject [

	lam := anObject
]

{ #category : #accessing }
LambcalcAppLamNode >> val [

	^ val
]

{ #category : #accessing }
LambcalcAppLamNode >> val: anObject [

	val := anObject
]
