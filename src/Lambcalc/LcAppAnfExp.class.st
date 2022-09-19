Class {
	#name : #LcAppAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'binding',
		'funName',
		'params',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcAppAnfExp class >> binding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  funName: aVarAnfValue
		  params: aCollection
		  rest: anAnfExp
]

{ #category : #'closure conversion' }
LcAppAnfExp >> closureConvert [

	| ptr |
	ptr := funName , LcTemp fresh printString.
	^ LcProjAnfExp
		  binding: ptr
		  tupleName: funName
		  index: 0
		  rest: (LcAppAnfExp
				   binding: binding
				   funName: ptr
				   params: (params copyWithFirst: (LcVarAnfValue var: funName))
				   rest: rest closureConvert)
]

{ #category : #'free variables' }
LcAppAnfExp >> freeVarsWith: aSet [

	| freeVars restFreeVars |
	freeVars := (LcVarAnfValue var: funName) freeVarsWith: aSet.
	params do: [ :param | 
		freeVars := freeVars union: (param freeVarsWith: aSet) ].

	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ freeVars union: restFreeVars
]

{ #category : #initialization }
LcAppAnfExp >> initializeBinding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	binding := aString.
	funName := aVarAnfValue.
	params := aCollection.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LcAppAnfExp >> lowerWith: lower [

	| loweredParams casted |
	loweredParams := params collect: [ :param | 
		                 { 
			                 LcI64Ty new.
			                 param lower } ].
	casted := 'c' , LcTemp fresh printString.

	lower instrs
		add: { 
				casted.
				(LcIntToPtrInsn
					 ty1: LcI64Ty new
					 val: (LcIdOperand var: funName)
					 ty2: (LcPtrTy ty: (LcFunTy ty: LcLower fty))) };
		add: { 
				binding.
				(LcCallInsn
					 ty: LcI64Ty new
					 fun: (LcIdOperand var: casted)
					 args: loweredParams) }.
	rest lowerWith: lower
]
