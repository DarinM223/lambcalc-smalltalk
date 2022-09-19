Class {
	#name : #LcAppLamNode,
	#superclass : #LcLamNode,
	#instVars : [
		'lam',
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LcAppLamNode >> anfConvertWith: aFullBlockClosure [

	^ self lam anfConvertWith: [ :f | 
		  self val anfConvertWith: [ :x | 
			  f applyVal: x andCont: aFullBlockClosure ] ]
]

{ #category : #accessing }
LcAppLamNode >> lam [

	^ lam
]

{ #category : #accessing }
LcAppLamNode >> lam: anObject [

	lam := anObject
]

{ #category : #accessing }
LcAppLamNode >> val [

	^ val
]

{ #category : #accessing }
LcAppLamNode >> val: anObject [

	val := anObject
]
