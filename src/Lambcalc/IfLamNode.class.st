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

{ #category : #'anf conversion' }
IfLamNode >> anfConvertWith: aFullBlockClosure [

	| j p join |
	^ self test anfConvertWith: [ :t | 
		  j := 'j' , Temp fresh printString.
		  p := 'p' , Temp fresh printString.
		  join := [ :v | JumpAnfExp join: j val: v ].
		  JoinAnfExp
			  binding: j
			  valueBinding: p
			  body: (aFullBlockClosure value: (VarAnfValue var: p))
			  rest: (IfAnfExp
					   testValue: t
					   trueExp: (self trueBranch anfConvertWith: join)
					   falseExp: (self falseBranch anfConvertWith: join)) ]
]

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
