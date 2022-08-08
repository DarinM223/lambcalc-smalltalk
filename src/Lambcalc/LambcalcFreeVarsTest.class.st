Class {
	#name : #LambcalcFreeVarsTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LambcalcFreeVarsTest >> testFactorial5 [

	| parser node freeVars |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.

	freeVars := node anfConvert freeVars.
	self assert: freeVars equals: Set empty
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsApp [

	| exp |
	exp := LambcalcAppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (LambcalcVarAnfValue var: 'a').
				       (LambcalcVarAnfValue var: 'b') }
		       rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b'. 'f' })
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsFunction [

	| exp |
	exp := LambcalcFunAnfExp
		       binding: 'f'
		       params: { 'x'. 'y' }
		       body: (LambcalcBopAnfExp
				        binding: 'r1'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'x')
				        right: (LambcalcVarAnfValue var: 'y')
				        rest: (LambcalcBopAnfExp
						         binding: 'r2'
						         op: LambcalcMultOp
						         left: (LambcalcVarAnfValue var: 'a')
						         right: (LambcalcVarAnfValue var: 'b')
						         rest: (LambcalcBopAnfExp
								          binding: 'r3'
								          op: LambcalcMinusOp
								          left: (LambcalcVarAnfValue var: 'r1')
								          right: (LambcalcVarAnfValue var: 'r2')
								          rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r3')))))
		       rest: (LambcalcAppAnfExp
				        binding: 'r4'
				        funName: 'f'
				        params: { (LambcalcVarAnfValue var: 'f') }
				        rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r4'))).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b' })
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsIf [

	| exp |
	exp := LambcalcIfAnfExp
		       testValue: (LambcalcVarAnfValue var: 'a')
		       trueExp: (LambcalcBopAnfExp
				        binding: 'r'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'a')
				        right: (LambcalcVarAnfValue var: 'b')
				        rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')))
		       falseExp: (LambcalcBopAnfExp
				        binding: 'r'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'a')
				        right: (LambcalcVarAnfValue var: 'c')
				        rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r'))).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b'. 'c' })
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsJoinNil [

	| exp |
	exp := LambcalcJoinAnfExp
		       binding: 'j'
		       valueBinding: nil
		       body: (LambcalcBopAnfExp
				        binding: 'r'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'p')
				        right: (LambcalcVarAnfValue var: 'x')
				        rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')))
		       rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)).
	self assert: exp freeVars equals: (Set withAll: { 'x'. 'p' })
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsJoinValue [

	| exp |
	exp := LambcalcJoinAnfExp
		       binding: 'j'
		       valueBinding: 'p'
		       body: (LambcalcBopAnfExp
				        binding: 'r'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'p')
				        right: (LambcalcVarAnfValue var: 'x')
				        rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')))
		       rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)).
	self assert: exp freeVars equals: (Set with: 'x')
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsJumpNil [

	| exp |
	exp := LambcalcJumpAnfExp join: 'j' val: nil.
	self assert: exp freeVars equals: Set empty
]

{ #category : #tests }
LambcalcFreeVarsTest >> testFreeVarsJumpValue [

	| exp |
	exp := LambcalcJumpAnfExp join: 'j' val: (LambcalcVarAnfValue var: 'a').
	self assert: exp freeVars equals: (Set withAll: { 'a' })
]
