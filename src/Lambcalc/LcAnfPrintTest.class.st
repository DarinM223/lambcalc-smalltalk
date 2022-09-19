Class {
	#name : #LcAnfPrintTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LcAnfPrintTest >> testPrintAppAnfExp [

	| exp |
	exp := LcAppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (LcVarAnfValue var: 'x').
				       (LcVarAnfValue var: 'y').
				       (LcVarAnfValue var: 'z') }
		       rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')).
	self
		assert: exp printString
		equals:
		'(LcAppAnfExp binding: ''r'' funName: ''f'' params: { (LcVarAnfValue var: ''x''). (LcVarAnfValue var: ''y''). (LcVarAnfValue var: ''z''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r'')))'
]

{ #category : #tests }
LcAnfPrintTest >> testPrintFunAnfExp [

	| exp |
	exp := LcFunAnfExp
		       binding: 'f'
		       params: { 'x'. 'y' }
		       body: (LcHaltAnfExp val: (LcVarAnfValue var: 'x'))
		       rest: (LcHaltAnfExp val: (LcIntAnfValue val: 1)).
	self
		assert: exp printString
		equals:
		'(LcFunAnfExp binding: ''f'' params: { ''x''. ''y''. } body: (LcHaltAnfExp val: (LcVarAnfValue var: ''x'')) rest: (LcHaltAnfExp val: (LcIntAnfValue val: 1)))'
]

{ #category : #tests }
LcAnfPrintTest >> testPrintFunc [

	| funcs expected |
	funcs := LcFunc
		         binding: 'f'
		         params: { 'x'. 'y' }
		         entry: (LcJoin
				          binding: 'j'
				          valueBinding: 'p'
				          body: (LcHaltAnfExp val: (LcVarAnfValue var: 'p')))
		         joins: OrderedCollection new.
	expected := '(LcFunc binding: ''f'' params: { ''x''. ''y''. } entry: (LcJoin binding: ''j'' valueBinding: ''p'' body: (LcHaltAnfExp val: (LcVarAnfValue var: ''p''))) joins: (OrderedCollection withAll: { }))'.
	self assert: funcs printString equals: expected
]

{ #category : #tests }
LcAnfPrintTest >> testPrintSingleParamHasPeriod [

	| exp |
	exp := LcFunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (LcHaltAnfExp val: (LcVarAnfValue var: 'x'))
		       rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)).
	self
		assert: exp printString
		equals:
		'(LcFunAnfExp binding: ''f'' params: { ''x''. } body: (LcHaltAnfExp val: (LcVarAnfValue var: ''x'')) rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)))'
]
