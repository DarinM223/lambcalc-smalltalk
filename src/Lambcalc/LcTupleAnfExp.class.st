Class {
	#name : #LcTupleAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'binding',
		'values',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcTupleAnfExp class >> binding: aString values: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  values: aCollection
		  rest: anAnfExp
]

{ #category : #initialization }
LcTupleAnfExp >> initializeBinding: aString values: aCollection rest: anAnfExp [

	binding := aString.
	values := aCollection.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LcTupleAnfExp >> lowerWith: lower [

	| ptr size off op |
	ptr := 'ptr' , LcTemp fresh printString.
	size := values size * 8.
	lower instrs
		add: { 
				ptr.
				(LcCallInsn
					 ty: (LcPtrTy ty: LcI64Ty new)
					 fun: (LcGidOperand var: 'malloc')
					 args: { { 
							 LcI64Ty new.
							 (LcConstOperand val: size) } }) };
		add: { 
				binding.
				(LcPtrToIntInsn
					 ty1: (LcPtrTy ty: LcI64Ty new)
					 ptr: (LcIdOperand var: ptr)
					 ty2: LcI64Ty new) }.

	values withIndexDo: [ :v :i | 
		off := 'off' , LcTemp fresh printString.
		op := v lower.
		lower instrs add: { 
				off.
				(LcGepInsn
					 ty: (LcPtrTy ty: LcI64Ty new)
					 ptr: (LcIdOperand var: ptr)
					 indexes: { (LcConstOperand val: i - 1) }) }.
		op class == LcGidOperand
			ifTrue: [ 
				| casted |
				casted := 'casted' , LcTemp fresh printString.
				lower instrs
					add: { 
							casted.
							(LcPtrToIntInsn
								 ty1: (LcPtrTy ty: (LcFunTy ty: LcLower fty))
								 ptr: op
								 ty2: LcI64Ty new) };
					add: { 
							''.
							(LcStoreInsn
								 ty: LcI64Ty new
								 src: (LcIdOperand var: casted)
								 dest: (LcIdOperand var: off)) } ]
			ifFalse: [ 
				op class == LcIdOperand
					ifTrue: [ 
						lower instrs add: { 
								''.
								(LcStoreInsn ty: LcI64Ty new src: op dest: (LcIdOperand var: off)) } ]
					ifFalse: [ self error: 'Constants or null cannot reach here' ] ] ].

	rest lowerWith: lower
]
