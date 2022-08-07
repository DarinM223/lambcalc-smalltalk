Class {
	#name : #AppAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'funName',
		'params',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
AppAnfExp class >> binding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  funName: aVarAnfValue
		  params: aCollection
		  rest: anAnfExp
]

{ #category : #'closure conversion' }
AppAnfExp >> closureConvert [

	| ptr |
	ptr := funName , Temp fresh printString.
	^ ProjAnfExp
		  binding: ptr
		  tupleName: funName
		  index: 0
		  rest: (AppAnfExp
				   binding: binding
				   funName: ptr
				   params: (params copyWithFirst: (VarAnfValue var: funName))
				   rest: rest closureConvert)
]

{ #category : #'free variables' }
AppAnfExp >> freeVarsWith: aSet [

	| freeVars restFreeVars |
	freeVars := (VarAnfValue var: funName) freeVarsWith: aSet.
	params do: [ :param | 
		freeVars := freeVars union: (param freeVarsWith: aSet) ].

	aSet add: binding.
	restFreeVars := rest freeVarsWith: aSet.
	aSet remove: binding.
	^ freeVars union: restFreeVars
]

{ #category : #initialization }
AppAnfExp >> initializeBinding: aString funName: aVarAnfValue params: aCollection rest: anAnfExp [

	binding := aString.
	funName := aVarAnfValue.
	params := aCollection.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
AppAnfExp >> lowerWith: lower [

	| loweredParams casted |
	loweredParams := params collect: [ :param | 
		                 { 
			                 I64Ty new.
			                 param lower } ].
	casted := 'c' , Temp fresh printString.

	lower instrs
		add: { 
				casted.
				(IntToPtrInsn
					 ty1: I64Ty new
					 val: (IdOperand var: funName)
					 ty2: (PtrTy ty: (FunTy ty: Lower fty))) };
		add: { 
				binding.
				(CallInsn
					 ty: I64Ty new
					 fun: (IdOperand var: casted)
					 args: loweredParams) }.
	rest lowerWith: lower
]
