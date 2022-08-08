Class {
	#name : #LambcalcTupleAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'binding',
		'values',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcTupleAnfExp class >> binding: aString values: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  values: aCollection
		  rest: anAnfExp
]

{ #category : #initialization }
LambcalcTupleAnfExp >> initializeBinding: aString values: aCollection rest: anAnfExp [

	binding := aString.
	values := aCollection.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LambcalcTupleAnfExp >> lowerWith: lower [

	| ptr size off op |
	ptr := 'ptr' , LambcalcTemp fresh printString.
	size := values size * 8.
	lower instrs
		add: { 
				ptr.
				(LambcalcCallInsn
					 ty: (LambcalcPtrTy ty: LambcalcI64Ty new)
					 fun: (LambcalcGidOperand var: 'malloc')
					 args: { { 
							 LambcalcI64Ty new.
							 (LambcalcConstOperand val: size) } }) };
		add: { 
				binding.
				(LambcalcPtrToIntInsn
					 ty1: (LambcalcPtrTy ty: LambcalcI64Ty new)
					 ptr: (LambcalcIdOperand var: ptr)
					 ty2: LambcalcI64Ty new) }.

	values withIndexDo: [ :v :i | 
		off := 'off' , LambcalcTemp fresh printString.
		op := v lower.
		lower instrs add: { 
				off.
				(LambcalcGepInsn
					 ty: (LambcalcPtrTy ty: LambcalcI64Ty new)
					 ptr: (LambcalcIdOperand var: ptr)
					 indexes: { (LambcalcConstOperand val: i - 1) }) }.
		op class == LambcalcGidOperand
			ifTrue: [ 
				| casted |
				casted := 'casted' , LambcalcTemp fresh printString.
				lower instrs
					add: { 
							casted.
							(LambcalcPtrToIntInsn
								 ty1: (LambcalcPtrTy ty: (LambcalcFunTy ty: LambcalcLower fty))
								 ptr: op
								 ty2: LambcalcI64Ty new) };
					add: { 
							''.
							(LambcalcStoreInsn
								 ty: LambcalcI64Ty new
								 src: (LambcalcIdOperand var: casted)
								 dest: (LambcalcIdOperand var: off)) } ]
			ifFalse: [ 
				op class == LambcalcIdOperand
					ifTrue: [ 
						lower instrs add: { 
								''.
								(LambcalcStoreInsn ty: LambcalcI64Ty new src: op dest: (LambcalcIdOperand var: off)) } ]
					ifFalse: [ self error: 'Constants or null cannot reach here' ] ] ].

	rest lowerWith: lower
]
