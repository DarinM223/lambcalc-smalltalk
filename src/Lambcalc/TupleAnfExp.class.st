Class {
	#name : #TupleAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'values',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
TupleAnfExp class >> binding: aString values: aCollection rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  values: aCollection
		  rest: anAnfExp
]

{ #category : #initialization }
TupleAnfExp >> initializeBinding: aString values: aCollection rest: anAnfExp [

	binding := aString.
	values := aCollection.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
TupleAnfExp >> lowerWith: lower [

	| ptr size off op |
	ptr := 'ptr' , Temp fresh printString.
	size := values size * 8.
	lower instrs
		add: { 
				ptr.
				(CallInsn
					 ty: (PtrTy ty: I64Ty new)
					 fun: (GidOperand var: 'malloc')
					 args: { { 
							 I64Ty new.
							 (ConstOperand val: size) } }) };
		add: { 
				binding.
				(PtrToIntInsn
					 ty1: (PtrTy ty: I64Ty new)
					 ptr: (IdOperand var: ptr)
					 ty2: I64Ty new) }.

	values withIndexDo: [ :v :i | 
		off := 'off' , Temp fresh printString.
		op := v lower.
		lower instrs add: { 
				off.
				(GepInsn
					 ty: (PtrTy ty: I64Ty new)
					 ptr: (IdOperand var: ptr)
					 indexes: { (ConstOperand val: i - 1) }) }.
		op class == GidOperand
			ifTrue: [ 
				| casted |
				casted := 'casted' , Temp fresh printString.
				lower instrs
					add: { 
							casted.
							(PtrToIntInsn
								 ty1: (PtrTy ty: (FunTy ty: Lower fty))
								 ptr: op
								 ty2: I64Ty new) };
					add: { 
							''.
							(StoreInsn
								 ty: I64Ty new
								 src: (IdOperand var: casted)
								 dest: (IdOperand var: off)) } ]
			ifFalse: [ 
				op class == IdOperand
					ifTrue: [ 
						lower instrs add: { 
								''.
								(StoreInsn ty: I64Ty new src: op dest: (IdOperand var: off)) } ]
					ifFalse: [ self error: 'Constants or null cannot reach here' ] ] ].

	rest lowerWith: lower
]
