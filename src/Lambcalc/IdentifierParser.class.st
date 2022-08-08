Class {
	#name : #IdentifierParser,
	#superclass : #Object,
	#instVars : [
		'parser',
		'keywords'
	],
	#category : #'Lambcalc-Parser'
}

{ #category : #initialization }
IdentifierParser >> initialize [

	super initialize.
	keywords := { 'if'. 'then'. 'else'. 'fn' } asSet.
	parser := (#letter asParser
	           , ($_ asParser / #letter asParser / #digit asParser) star)
		          flatten ==> [ :val | 
	          (keywords includes: val)
		          ifTrue: [ 
		          PPFailure message: 'Identifier cannot be a keyword' ]
		          ifFalse: [ val ] ]
]

{ #category : #parsing }
IdentifierParser >> parseOn: ctxt [

	| identifier momento |
	momento := ctxt remember.
	identifier := parser parseOn: ctxt.
	identifier isPetitFailure ifTrue: [ 
		ctxt restore: momento.
		^ identifier ].
	^ VarLamNode new var: identifier
]
