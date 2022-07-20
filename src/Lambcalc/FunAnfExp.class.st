Class {
	#name : #FunAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'params',
		'body',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
FunAnfExp class >> binding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	^ self new
		  initializeBinding: aString
		  params: aCollection
		  body: anAnfExp
		  rest: anAnfExp2
]

{ #category : #'closure conversion' }
FunAnfExp >> closureConvert [

	| env freeVars exp |
	env := 'env' , Temp fresh printString.
	freeVars := (body freeVars difference: params) asArray.
	exp := body closureConvert.
	freeVars withIndexDo: [ :var :index | 
		exp := ProjAnfExp
			       binding: var
			       tupleName: env
			       index: index
			       rest: exp ].
	^ FunAnfExp
		  binding: binding
		  params: (params copyWithFirst: env)
		  body: exp
		  rest: (TupleAnfExp
				   binding: binding
				   values:
					   ((freeVars collect: [ :var | VarAnfValue var: var ]) 
						    copyWithFirst: (GlobAnfValue var: binding))
				   rest: rest closureConvert)
]

{ #category : #'free variables' }
FunAnfExp >> freeVarsWith: aSet [

	| bodyFreeVars restFreeVars |
	aSet addAll: params.
	bodyFreeVars := body freeVarsWith: aSet.
	aSet removeAll: params.
	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ bodyFreeVars union: restFreeVars
]

{ #category : #initialization }
FunAnfExp >> initializeBinding: aString params: aCollection body: anAnfExp rest: anAnfExp2 [

	binding := aString.
	params := aCollection.
	body := anAnfExp.
	rest := anAnfExp2
]
