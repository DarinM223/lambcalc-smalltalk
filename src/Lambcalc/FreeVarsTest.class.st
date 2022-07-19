Class {
	#name : #FreeVarsTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
FreeVarsTest >> testFactorial5 [

	| parser node freeVars |
	Temp reset.
	parser := Parser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.

	freeVars := node anfConvert freeVars.
	self assert: freeVars equals: Set empty
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsApp [

	| exp |
	exp := AppAnfExp
		       binding: 'r'
		       funName: (VarAnfValue var: 'f')
		       params: { 
				       (VarAnfValue var: 'a').
				       (VarAnfValue var: 'b') }
		       rest: (HaltAnfExp val: (VarAnfValue var: 'r')).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b'. 'f' })
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsFunction [

	| exp |
	exp := FunAnfExp
		       binding: 'f'
		       params: { 'x'. 'y' }
		       body: (BopAnfExp
				        binding: 'r1'
				        op: PlusOp
				        left: (VarAnfValue var: 'x')
				        right: (VarAnfValue var: 'y')
				        rest: (BopAnfExp
						         binding: 'r2'
						         op: MultOp
						         left: (VarAnfValue var: 'a')
						         right: (VarAnfValue var: 'b')
						         rest: (BopAnfExp
								          binding: 'r3'
								          op: MinusOp
								          left: (VarAnfValue var: 'r1')
								          right: (VarAnfValue var: 'r2')
								          rest: (HaltAnfExp val: (VarAnfValue var: 'r3')))))
		       rest: (AppAnfExp
				        binding: 'r4'
				        funName: (VarAnfValue var: 'f')
				        params: { (VarAnfValue var: 'f') }
				        rest: (HaltAnfExp val: (VarAnfValue var: 'r4'))).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b' })
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsIf [

	| exp |
	exp := IfAnfExp
		       testValue: (VarAnfValue var: 'a')
		       trueExp: (BopAnfExp
				        binding: 'r'
				        op: PlusOp
				        left: (VarAnfValue var: 'a')
				        right: (VarAnfValue var: 'b')
				        rest: (HaltAnfExp val: (VarAnfValue var: 'r')))
		       falseExp: (BopAnfExp
				        binding: 'r'
				        op: PlusOp
				        left: (VarAnfValue var: 'a')
				        right: (VarAnfValue var: 'c')
				        rest: (HaltAnfExp val: (VarAnfValue var: 'r'))).
	self assert: exp freeVars equals: (Set withAll: { 'a'. 'b'. 'c' })
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsJoinNil [

	| exp |
	exp := JoinAnfExp
		       binding: 'j'
		       valueBinding: nil
		       body: (BopAnfExp
				        binding: 'r'
				        op: PlusOp
				        left: (VarAnfValue var: 'p')
				        right: (VarAnfValue var: 'x')
				        rest: (HaltAnfExp val: (VarAnfValue var: 'r')))
		       rest: (HaltAnfExp val: (IntAnfValue val: 0)).
	self assert: exp freeVars equals: (Set withAll: { 'x'. 'p' })
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsJoinValue [

	| exp |
	exp := JoinAnfExp
		       binding: 'j'
		       valueBinding: 'p'
		       body: (BopAnfExp
				        binding: 'r'
				        op: PlusOp
				        left: (VarAnfValue var: 'p')
				        right: (VarAnfValue var: 'x')
				        rest: (HaltAnfExp val: (VarAnfValue var: 'r')))
		       rest: (HaltAnfExp val: (IntAnfValue val: 0)).
	self assert: exp freeVars equals: (Set with: 'x')
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsJumpNil [

	| exp |
	exp := JumpAnfExp join: 'j' val: nil.
	self assert: exp freeVars equals: Set empty
]

{ #category : #tests }
FreeVarsTest >> testFreeVarsJumpValue [

	| exp |
	exp := JumpAnfExp join: 'j' val: (VarAnfValue var: 'a').
	self assert: exp freeVars equals: (Set withAll: { 'a' })
]
