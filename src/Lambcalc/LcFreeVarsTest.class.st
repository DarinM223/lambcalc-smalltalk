Class {
	#name : #LcFreeVarsTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LcFreeVarsTest >> testFactorial5 [

	| parser node freeVars |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.

	freeVars := node anfConvert freeVars.
	self assert: freeVars equals: Set empty
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsApp [

	| exp |
	exp := LcAppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (LcVarAnfValue var: 'a').
				       (LcVarAnfValue var: 'b') }
		       rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b'. 'f' })
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsFunction [

	| exp |
	exp := LcFunAnfExp
		       binding: 'f'
		       params: { 'x'. 'y' }
		       body: (LcBopAnfExp
				        binding: 'r1'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'x')
				        right: (LcVarAnfValue var: 'y')
				        rest: (LcBopAnfExp
						         binding: 'r2'
						         op: LcMultOp
						         left: (LcVarAnfValue var: 'a')
						         right: (LcVarAnfValue var: 'b')
						         rest: (LcBopAnfExp
								          binding: 'r3'
								          op: LcMinusOp
								          left: (LcVarAnfValue var: 'r1')
								          right: (LcVarAnfValue var: 'r2')
								          rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r3')))))
		       rest: (LcAppAnfExp
				        binding: 'r4'
				        funName: 'f'
				        params: { (LcVarAnfValue var: 'f') }
				        rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r4'))).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b' })
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsIf [

	| exp |
	exp := LcIfAnfExp
		       testValue: (LcVarAnfValue var: 'a')
		       trueExp: (LcBopAnfExp
				        binding: 'r'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'a')
				        right: (LcVarAnfValue var: 'b')
				        rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')))
		       falseExp: (LcBopAnfExp
				        binding: 'r'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'a')
				        right: (LcVarAnfValue var: 'c')
				        rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r'))).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b'. 'c' })
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsJoinNil [

	| exp |
	exp := LcJoinAnfExp
		       binding: 'j'
		       valueBinding: nil
		       body: (LcBopAnfExp
				        binding: 'r'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'p')
				        right: (LcVarAnfValue var: 'x')
				        rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')))
		       rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)).
	self assert: exp freeVars equals: (Set withAll: { 'x'. 'p' })
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsJoinValue [

	| exp |
	exp := LcJoinAnfExp
		       binding: 'j'
		       valueBinding: 'p'
		       body: (LcBopAnfExp
				        binding: 'r'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'p')
				        right: (LcVarAnfValue var: 'x')
				        rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')))
		       rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)).
	self assert: exp freeVars equals: (Set with: 'x')
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsJumpNil [

	| exp |
	exp := LcJumpAnfExp join: 'j' val: nil.
	self assert: exp freeVars equals: Set empty
]

{ #category : #tests }
LcFreeVarsTest >> testFreeVarsJumpValue [

	| exp |
	exp := LcJumpAnfExp join: 'j' val: (LcVarAnfValue var: 'a').
	self assert: exp freeVars equals: (Set withAll: { 'a' })
]
