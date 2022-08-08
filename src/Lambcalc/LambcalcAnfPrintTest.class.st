Class {
	#name : #LambcalcAnfPrintTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LambcalcAnfPrintTest >> testPrintAppAnfExp [

	| exp |
	exp := LambcalcAppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (LambcalcVarAnfValue var: 'x').
				       (LambcalcVarAnfValue var: 'y').
				       (LambcalcVarAnfValue var: 'z') }
		       rest:
		       (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')).
	self
		assert: exp printString
		equals:
		'(LambcalcAppAnfExp binding: ''r'' funName: ''f'' params: { (LambcalcVarAnfValue var: ''x''). (LambcalcVarAnfValue var: ''y''). (LambcalcVarAnfValue var: ''z''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r'')))'
]

{ #category : #tests }
LambcalcAnfPrintTest >> testPrintFunAnfExp [

	| exp |
	exp := LambcalcFunAnfExp
		       binding: 'f'
		       params: { 'x'. 'y' }
		       body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'x'))
		       rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 1)).
	self
		assert: exp printString
		equals:
		'(LambcalcFunAnfExp binding: ''f'' params: { ''x''. ''y''. } body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''x'')) rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 1)))'
]

{ #category : #tests }
LambcalcAnfPrintTest >> testPrintFunc [

	| funcs expected |
	funcs := LambcalcFunc
		         binding: 'f'
		         params: { 'x'. 'y' }
		         entry: (LambcalcJoin
				          binding: 'j'
				          valueBinding: 'p'
				          body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'p')))
		         joins: OrderedCollection new.
	expected := '(LambcalcFunc binding: ''f'' params: { ''x''. ''y''. } entry: (LambcalcJoin binding: ''j'' valueBinding: ''p'' body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''p''))) joins: (OrderedCollection withAll: { }))'.
	self assert: funcs printString equals: expected
]

{ #category : #tests }
LambcalcAnfPrintTest >> testPrintSingleParamHasPeriod [

	| exp |
	exp := LambcalcFunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'x'))
		       rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)).
	self
		assert: exp printString
		equals:
		'(LambcalcFunAnfExp binding: ''f'' params: { ''x''. } body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''x'')) rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)))'
]
