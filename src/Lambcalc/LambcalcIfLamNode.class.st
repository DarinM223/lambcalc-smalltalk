Class {
	#name : #LambcalcIfLamNode,
	#superclass : #LambcalcLamNode,
	#instVars : [
		'test',
		'trueBranch',
		'falseBranch'
	],
	#category : #'Lambcalc-Lambda'
}

{ #category : #'anf conversion' }
LambcalcIfLamNode >> anfConvertWith: aFullBlockClosure [

	| j p join |
	^ self test anfConvertWith: [ :t | 
		  j := 'j' , LambcalcTemp fresh printString.
		  p := 'p' , LambcalcTemp fresh printString.
		  join := [ :v | LambcalcJumpAnfExp join: j val: v ].
		  LambcalcJoinAnfExp
			  binding: j
			  valueBinding: p
			  body: (aFullBlockClosure value: (LambcalcVarAnfValue var: p))
			  rest: (LambcalcIfAnfExp
					   testValue: t
					   trueExp: (self trueBranch anfConvertWith: join)
					   falseExp: (self falseBranch anfConvertWith: join)) ]
]

{ #category : #accessing }
LambcalcIfLamNode >> falseBranch [

	^ falseBranch
]

{ #category : #accessing }
LambcalcIfLamNode >> falseBranch: anObject [

	falseBranch := anObject
]

{ #category : #accessing }
LambcalcIfLamNode >> test [

	^ test
]

{ #category : #accessing }
LambcalcIfLamNode >> test: anObject [

	test := anObject
]

{ #category : #accessing }
LambcalcIfLamNode >> trueBranch [

	^ trueBranch
]

{ #category : #accessing }
LambcalcIfLamNode >> trueBranch: anObject [

	trueBranch := anObject
]
