Class {
	#name : #AppLamNode,
	#superclass : #LamNode,
	#instVars : [
		'lam',
		'val'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
AppLamNode >> anfConvertWith: aFullBlockClosure [

	^ self lam anfConvertWith: [ :f | 
		  self val anfConvertWith: [ :x | 
			  f applyVal: x andCont: aFullBlockClosure ] ]
]

{ #category : #accessing }
AppLamNode >> lam [

	^ lam
]

{ #category : #accessing }
AppLamNode >> lam: anObject [

	lam := anObject
]

{ #category : #accessing }
AppLamNode >> val [

	^ val
]

{ #category : #accessing }
AppLamNode >> val: anObject [

	val := anObject
]
