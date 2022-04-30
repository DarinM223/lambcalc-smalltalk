Class {
	#name : #LamLamNode,
	#superclass : #LamNode,
	#instVars : [
		'var',
		'body'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #accessing }
LamLamNode >> body [

	^ body
]

{ #category : #accessing }
LamLamNode >> body: anObject [

	body := anObject
]

{ #category : #accessing }
LamLamNode >> var [

	^ var
]

{ #category : #accessing }
LamLamNode >> var: anObject [

	var := anObject
]
