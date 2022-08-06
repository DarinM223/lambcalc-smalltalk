Class {
	#name : #ProjAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'binding',
		'tupleName',
		'index',
		'rest'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
ProjAnfExp class >> binding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	^ self new
		  initializeBinding: aString
		  tupleName: aString2
		  index: anInteger
		  rest: anAnfExp
]

{ #category : #initialization }
ProjAnfExp >> initializeBinding: aString tupleName: aString2 index: anInteger rest: anAnfExp [

	binding := aString.
	tupleName := aString2.
	index := anInteger.
	rest := anAnfExp
]

{ #category : #'llvm lowering' }
ProjAnfExp >> lowerWith: lower [

	| addr tuple |
	addr := 'a' , Temp fresh printString.
	tuple := 't' , Temp fresh printString.
	lower instrs
		add: { 
				tuple.
				(IntToPtrInsn
					 ty1: I64Ty new
					 val: (IdOperand var: tupleName)
					 ty2: (PtrTy ty: I64Ty new)) };
		add: { 
				addr.
				(GepInsn
					 ty: (PtrTy ty: I64Ty new)
					 ptr: (IdOperand var: tuple)
					 indexes: { (ConstOperand val: index) }) };
		add: { 
				binding.
				(LoadInsn ty: (PtrTy ty: I64Ty new) ptr: (IdOperand var: addr)) }.
	rest lowerWith: lower
]
