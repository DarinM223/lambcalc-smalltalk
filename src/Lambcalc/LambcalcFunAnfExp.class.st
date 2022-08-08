Class {
	#name : #LambcalcFunAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'binding',
		'params',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcFunAnfExp class >> binding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  params: aCollection
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #'closure conversion' }
LambcalcFunAnfExp >> closureConvert [

	| env freeVars exp |
	env := 'env' , LambcalcTemp fresh printString.
	freeVars := (body freeVars difference: params) asArray.
	exp := body closureConvert.
	freeVars withIndexDo: [ :var :index | 
		exp := LambcalcProjAnfExp
			       binding: var
			       tupleName: env
			       index: index
			       rest: exp ].
	^ LambcalcFunAnfExp
		  binding: binding
		  params: (params copyWithFirst: env)
		  body: exp
		  rest: (LambcalcTupleAnfExp
				   binding: binding
				   values:
					   ((freeVars collect: [ :var | LambcalcVarAnfValue var: var ]) 
						    copyWithFirst: (LambcalcGlobAnfValue var: binding))
				   rest: rest closureConvert)
]

{ #category : #'free variables' }
LambcalcFunAnfExp >> freeVarsWith: aSet [

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
LambcalcFunAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| bodyJoins hoistedBody hoistedRest entry |
	bodyJoins := OrderedCollection new.
	hoistedBody := body hoistWithFunctions: functions andJoins: bodyJoins.
	hoistedRest := rest hoistWithFunctions: functions andJoins: joins.
	entry := 'entry' , LambcalcTemp fresh printString.
	functions add: (LambcalcFunc
			 binding: binding
			 params: params
			 entry: (LambcalcJoin binding: entry valueBinding: nil body: hoistedBody)
			 joins: bodyJoins).
	^ hoistedRest
]

{ #category : #initialization }
LambcalcFunAnfExp >> initializeBinding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	params := aCollection.
	body := anAnfExp.
	rest := anAnfExp2
]
