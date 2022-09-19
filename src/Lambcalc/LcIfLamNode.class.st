Class {
	#name : #LcIfLamNode,
	#superclass : #LcLamNode,
	#instVars : [
		'test',
		'trueBranch',
		'falseBranch'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LcIfLamNode >> anfConvertWith: aFullBlockClosure [

	| j p join |
	^ self test anfConvertWith: [ :t | 
		  j := 'j' , LcTemp fresh printString.
		  p := 'p' , LcTemp fresh printString.
		  join := [ :v | LcJumpAnfExp join: j val: v ].
		  LcJoinAnfExp
			  binding: j
			  valueBinding: p
			  body: (aFullBlockClosure value: (LcVarAnfValue var: p))
			  rest: (LcIfAnfExp
					   testValue: t
					   trueExp: (self trueBranch anfConvertWith: join)
					   falseExp: (self falseBranch anfConvertWith: join)) ]
]

{ #category : #accessing }
LcIfLamNode >> falseBranch [

	^ falseBranch
]

{ #category : #accessing }
LcIfLamNode >> falseBranch: anObject [

	falseBranch := anObject
]

{ #category : #accessing }
LcIfLamNode >> test [

	^ test
]

{ #category : #accessing }
LcIfLamNode >> test: anObject [

	test := anObject
]

{ #category : #accessing }
LcIfLamNode >> trueBranch [

	^ trueBranch
]

{ #category : #accessing }
LcIfLamNode >> trueBranch: anObject [

	trueBranch := anObject
]
