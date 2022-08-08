Class {
	#name : #LambcalcProjAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'binding',
		'tupleName',
		'index',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcProjAnfExp class >> binding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  tupleName: aString2
		  index: anInteger
		  rest: anAnfExp
]

{ #category : #initialization }
LambcalcProjAnfExp >> initializeBinding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	binding := aString.
	tupleName := aString2.
	index := anInteger.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LambcalcProjAnfExp >> lowerWith: lower [

	| addr tuple |
	addr := 'a' , LambcalcTemp fresh printString.
	tuple := 't' , LambcalcTemp fresh printString.
	lower instrs
		add: { 
				tuple.
				(LambcalcIntToPtrInsn
					 ty1: LambcalcI64Ty new
					 val: (LambcalcIdOperand var: tupleName)
					 ty2: (LambcalcPtrTy ty: LambcalcI64Ty new)) };
		add: { 
				addr.
				(LambcalcGepInsn
					 ty: (LambcalcPtrTy ty: LambcalcI64Ty new)
					 ptr: (LambcalcIdOperand var: tuple)
					 indexes: { (LambcalcConstOperand val: index) }) };
		add: { 
				binding.
				(LambcalcLoadInsn ty: (LambcalcPtrTy ty: LambcalcI64Ty new) ptr: (LambcalcIdOperand var: addr)) }.
	rest lowerWith: lower
]
