Class {
	#name : #LcFunAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'binding',
		'params',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcFunAnfExp class >> binding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  params: aCollection
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #'closure conversion' }
LcFunAnfExp >> closureConvert [

	| env freeVars exp |
	env := 'env' , LcTemp fresh printString.
	freeVars := (body freeVars difference: params) asArray.
	exp := body closureConvert.
	freeVars withIndexDo: [ :var :index | 
		exp := LcProjAnfExp
			       binding: var
			       tupleName: env
			       index: index
			       rest: exp ].
	^ LcFunAnfExp
		  binding: binding
		  params: (params copyWithFirst: env)
		  body: exp
		  rest: (LcTupleAnfExp
				   binding: binding
				   values:
					   ((freeVars collect: [ :var | LcVarAnfValue var: var ]) 
						    copyWithFirst: (LcGlobAnfValue var: binding))
				   rest: rest closureConvert)
]

{ #category : #'free variables' }
LcFunAnfExp >> freeVarsWith: aSet [

	| bodyFreeVars restFreeVars |
	aSet addAll: params.
	bodyFreeVars := body freeVarsWith: aSet.
	aSet removeAll: params.
	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ bodyFreeVars union: restFreeVars
]

{ #category : #hoisting }
LcFunAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| bodyJoins hoistedBody hoistedRest entry |
	bodyJoins := OrderedCollection new.
	hoistedBody := body hoistWithFunctions: functions andJoins: bodyJoins.
	hoistedRest := rest hoistWithFunctions: functions andJoins: joins.
	entry := 'entry' , LcTemp fresh printString.
	functions add: (LcFunc
			 binding: binding
			 params: params
			 entry: (LcJoin binding: entry valueBinding: nil body: hoistedBody)
			 joins: bodyJoins).
	^ hoistedRest
]

{ #category : #initialization }
LcFunAnfExp >> initializeBinding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	params := aCollection.
	body := anAnfExp.
	rest := anAnfExp2
]
