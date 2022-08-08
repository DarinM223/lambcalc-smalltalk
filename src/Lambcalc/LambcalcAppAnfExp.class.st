Class {
	#name : #LambcalcAppAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'binding',
		'funName',
		'params',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcAppAnfExp class >> binding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  funName: aVarAnfValue
		  params: aCollection
		  rest: anAnfExp
]

{ #category : #'closure conversion' }
LambcalcAppAnfExp >> closureConvert [

	| ptr |
	ptr := funName , LambcalcTemp fresh printString.
	^ LambcalcProjAnfExp
		  binding: ptr
		  tupleName: funName
		  index: 0
		  rest: (LambcalcAppAnfExp
				   binding: binding
				   funName: ptr
				   params: (params copyWithFirst: (LambcalcVarAnfValue var: funName))
				   rest: rest closureConvert)
]

{ #category : #'free variables' }
LambcalcAppAnfExp >> freeVarsWith: aSet [

	| freeVars restFreeVars |
	freeVars := (LambcalcVarAnfValue var: funName) freeVarsWith: aSet.
	params do: [ :param | 
		freeVars := freeVars union: (param freeVarsWith: aSet) ].

	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ freeVars union: restFreeVars
]

{ #category : #initialization }
LambcalcAppAnfExp >> initializeBinding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	binding := aString.
	funName := aVarAnfValue.
	params := aCollection.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LambcalcAppAnfExp >> lowerWith: lower [

	| loweredParams casted |
	loweredParams := params collect: [ :param | 
		                 { 
			                 LambcalcI64Ty new.
			                 param lower } ].
	casted := 'c' , LambcalcTemp fresh printString.

	lower instrs
		add: { 
				casted.
				(LambcalcIntToPtrInsn
					 ty1: LambcalcI64Ty new
					 val: (LambcalcIdOperand var: funName)
					 ty2: (LambcalcPtrTy ty: (LambcalcFunTy ty: LambcalcLower fty))) };
		add: { 
				binding.
				(LambcalcCallInsn
					 ty: LambcalcI64Ty new
					 fun: (LambcalcIdOperand var: casted)
					 args: loweredParams) }.
	rest lowerWith: lower
]
