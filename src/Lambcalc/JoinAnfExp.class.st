Class {
	#name : #JoinAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'valueBinding',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
JoinAnfExp class >> binding: aString valueBinding: aString2 body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #'free variables' }
JoinAnfExp >> freeVarsWith: aSet [

	| bodyFreeVars |
	valueBinding ifNotNil: [ aSet add: valueBinding ].
	bodyFreeVars := body freeVarsWith: aSet.
	valueBinding ifNotNil: [ aSet remove: valueBinding ].
	^ bodyFreeVars union: (rest freeVarsWith: aSet)
]

{ #category : #hoisting }
JoinAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| hoistedBody hoistedRest |
	hoistedBody := body hoistWithFunctions: functions andJoins: joins.
	hoistedRest := rest hoistWithFunctions: functions andJoins: joins.
	joins add:
		(Join binding: binding valueBinding: valueBinding body: body).
	^ hoistedRest
]

{ #category : #initialization }
JoinAnfExp >> initializeBinding: aString valueBinding: aString2 body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp.
	rest := anAnfExp2
]
