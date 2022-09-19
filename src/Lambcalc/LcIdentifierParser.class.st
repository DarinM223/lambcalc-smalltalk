Class {
	#name : #LcIdentifierParser,
	#superclass : #Object,
	#instVars : [
		'parser',
		'keywords'
	],
	#category : #'Lambcalc-Parser'
}

{ #category : #initialization }
LcIdentifierParser >> initialize [

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
LcIdentifierParser >> parseOn: ctxt [

	| identifier momento |
	momento := ctxt remember.
	identifier := parser parseOn: ctxt.
	identifier isPetitFailure ifTrue: [ 
		ctxt restore: momento.
		^ identifier ].
	^ LcVarLamNode new var: identifier
]
