Class {
	#name : #AnfPrintTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
AnfPrintTest >> testPrintAppAnfExp [

	| exp |
	exp := AppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (VarAnfValue var: 'x').
				       (VarAnfValue var: 'y').
				       (VarAnfValue var: 'z') }
		       rest: (HaltAnfExp val: (VarAnfValue var: 'r')).
	self
		assert: exp printString
		equals:
		'(AppAnfExp binding: ''r'' funName: ''f'' params: { (VarAnfValue var: ''x''). (VarAnfValue var: ''y''). (VarAnfValue var: ''z''). } rest: (HaltAnfExp val: (VarAnfValue var: ''r'')))'
]

{ #category : #tests }
AnfPrintTest >> testPrintFunAnfExp [

	| exp |
	exp := FunAnfExp
		       binding: 'f'
		       params: { 'x'. 'y' }
		       body: (HaltAnfExp val: (VarAnfValue var: 'x'))
		       rest: (HaltAnfExp val: (IntAnfValue val: 1)).
	self
		assert: exp printString
		equals:
		'(FunAnfExp binding: ''f'' params: { ''x''. ''y''. } body: (HaltAnfExp val: (VarAnfValue var: ''x'')) rest: (HaltAnfExp val: (IntAnfValue val: 1)))'
]

{ #category : #tests }
AnfPrintTest >> testPrintFunc [

	| funcs expected |
	funcs := Func
		         binding: 'f'
		         params: { 'x'. 'y' }
		         entry: (Join
				          binding: 'j'
				          valueBinding: 'p'
				          body: (HaltAnfExp val: (VarAnfValue var: 'p')))
		         joins: OrderedCollection new.
	expected := '(Func binding: ''f'' params: { ''x''. ''y''. } entry: (Join binding: ''j'' valueBinding: ''p'' body: (HaltAnfExp val: (VarAnfValue var: ''p''))) joins: (OrderedCollection withAll: { }))'.
	self assert: funcs printString equals: expected
]

{ #category : #tests }
AnfPrintTest >> testPrintSingleParamHasPeriod [

	| exp |
	exp := FunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (HaltAnfExp val: (VarAnfValue var: 'x'))
		       rest: (HaltAnfExp val: (IntAnfValue val: 0)).
	self
		assert: exp printString
		equals:
		'(FunAnfExp binding: ''f'' params: { ''x''. } body: (HaltAnfExp val: (VarAnfValue var: ''x'')) rest: (HaltAnfExp val: (IntAnfValue val: 0)))'
]
