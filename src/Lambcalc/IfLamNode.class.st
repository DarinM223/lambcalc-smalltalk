Class {
	#name : #IfLamNode,
	#superclass : #LamNode,
	#instVars : [
		'test',
		'trueBranch',
		'falseBranch'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #accessing }
IfLamNode >> falseBranch [

	^ falseBranch
]

{ #category : #accessing }
IfLamNode >> falseBranch: anObject [

	falseBranch := anObject
]

{ #category : #accessing }
IfLamNode >> test [

	^ test
]

{ #category : #accessing }
IfLamNode >> test: anObject [

	test := anObject
]

{ #category : #accessing }
IfLamNode >> trueBranch [

	^ trueBranch
]

{ #category : #accessing }
IfLamNode >> trueBranch: anObject [

	trueBranch := anObject
]
