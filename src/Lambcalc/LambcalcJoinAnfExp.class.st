Class {
	#name : #LambcalcJoinAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'binding',
		'valueBinding',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcJoinAnfExp class >> binding: aString valueBinding: aString2 body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #'free variables' }
LambcalcJoinAnfExp >> freeVarsWith: aSet [

	| bodyFreeVars |
	valueBinding ifNotNil: [ aSet add: valueBinding ].
	bodyFreeVars := body freeVarsWith: aSet.
	valueBinding ifNotNil: [ aSet remove: valueBinding ].
	^ bodyFreeVars union: (rest freeVarsWith: aSet)
]

{ #category : #hoisting }
LambcalcJoinAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| hoistedBody hoistedRest |
	hoistedBody := body hoistWithFunctions: functions andJoins: joins.
	hoistedRest := rest hoistWithFunctions: functions andJoins: joins.
	joins add:
		(LambcalcJoin binding: binding valueBinding: valueBinding body: body).
	^ hoistedRest
]

{ #category : #initialization }
LambcalcJoinAnfExp >> initializeBinding: aString valueBinding: aString2 body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp.
	rest := anAnfExp2
]
