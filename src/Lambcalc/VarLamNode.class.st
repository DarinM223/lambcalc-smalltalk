Class {
	#name : #VarLamNode,
	#superclass : #LamNode,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #accessing }
VarLamNode >> var [

	^ var
]

{ #category : #accessing }
VarLamNode >> var: anObject [

	var := anObject
]
