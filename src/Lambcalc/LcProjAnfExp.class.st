Class {
	#name : #LcProjAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'binding',
		'tupleName',
		'index',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcProjAnfExp class >> binding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  tupleName: aString2
		  index: anInteger
		  rest: anAnfExp
]

{ #category : #initialization }
LcProjAnfExp >> initializeBinding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	binding := aString.
	tupleName := aString2.
	index := anInteger.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
LcProjAnfExp >> lowerWith: lower [

	| addr tuple |
	addr := 'a' , LcTemp fresh printString.
	tuple := 't' , LcTemp fresh printString.
	lower instrs
		add: { 
				tuple.
				(LcIntToPtrInsn
					 ty1: LcI64Ty new
					 val: (LcIdOperand var: tupleName)
					 ty2: (LcPtrTy ty: LcI64Ty new)) };
		add: { 
				addr.
				(LcGepInsn
					 ty: (LcPtrTy ty: LcI64Ty new)
					 ptr: (LcIdOperand var: tuple)
					 indexes: { (LcConstOperand val: index) }) };
		add: { 
				binding.
				(LcLoadInsn ty: (LcPtrTy ty: LcI64Ty new) ptr: (LcIdOperand var: addr)) }.
	rest lowerWith: lower
]
