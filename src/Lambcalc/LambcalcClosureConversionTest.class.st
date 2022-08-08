Class {
	#name : #LambcalcClosureConversionTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LambcalcClosureConversionTest >> testClosureConversionApplication [

	| exp result expected |
	LambcalcTemp reset.
	exp := LambcalcAppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (LambcalcVarAnfValue var: 'x').
				       (LambcalcIntAnfValue val: 0) }
		       rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')).
	result := exp closureConvert.
	expected := LambcalcProjAnfExp
		            binding: 'f0'
		            tupleName: 'f'
		            index: 0
		            rest: (LambcalcAppAnfExp
				             binding: 'r'
				             funName: 'f0'
				             params: { 
						             (LambcalcVarAnfValue var: 'f').
						             (LambcalcVarAnfValue var: 'x').
						             (LambcalcIntAnfValue val: 0) }
				             rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r'))).
	self assert: result printString equals: expected printString
]

{ #category : #tests }
LambcalcClosureConversionTest >> testClosureConversionFunction [

	| exp expected |
	LambcalcTemp reset.
	exp := LambcalcFunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (LambcalcBopAnfExp
				        binding: 'r'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'a')
				        right: (LambcalcVarAnfValue var: 'x')
				        rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')))
		       rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)).
	expected := LambcalcFunAnfExp
		            binding: 'f'
		            params: { 'env0'. 'x' }
		            body: (LambcalcProjAnfExp
				             binding: 'a'
				             tupleName: 'env0'
				             index: 1
				             rest: (LambcalcBopAnfExp
						              binding: 'r'
						              op: LambcalcPlusOp
						              left: (LambcalcVarAnfValue var: 'a')
						              right: (LambcalcVarAnfValue var: 'x')
						              rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r'))))
		            rest: (LambcalcTupleAnfExp
				             binding: 'f'
				             values: { 
						             (LambcalcGlobAnfValue var: 'f').
						             (LambcalcVarAnfValue var: 'a') }
				             rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0))).
	self
		assert: exp closureConvert printString
		equals: expected printString
]

{ #category : #tests }
LambcalcClosureConversionTest >> testClosureConversionFunctionMultiFree [

	| exp result expected |
	LambcalcTemp reset.
	exp := LambcalcFunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (LambcalcBopAnfExp
				        binding: 'r1'
				        op: LambcalcPlusOp
				        left: (LambcalcVarAnfValue var: 'a')
				        right: (LambcalcVarAnfValue var: 'x')
				        rest: (LambcalcBopAnfExp
						         binding: 'r2'
						         op: LambcalcPlusOp
						         left: (LambcalcVarAnfValue var: 'b')
						         right: (LambcalcVarAnfValue var: 'c')
						         rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r2'))))
		       rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)).
	result := exp closureConvert.
	expected := LambcalcFunAnfExp
		            binding: 'f'
		            params: { 'env0'. 'x' }
		            body: (LambcalcProjAnfExp
				             binding: 'b'
				             tupleName: 'env0'
				             index: 3
				             rest: (LambcalcProjAnfExp
						              binding: 'a'
						              tupleName: 'env0'
						              index: 2
						              rest: (LambcalcProjAnfExp
								               binding: 'c'
								               tupleName: 'env0'
								               index: 1
								               rest: (LambcalcBopAnfExp
										                binding: 'r1'
										                op: LambcalcPlusOp
										                left: (LambcalcVarAnfValue var: 'a')
										                right: (LambcalcVarAnfValue var: 'x')
										                rest: (LambcalcBopAnfExp
												                 binding: 'r2'
												                 op: LambcalcPlusOp
												                 left: (LambcalcVarAnfValue var: 'b')
												                 right: (LambcalcVarAnfValue var: 'c')
												                 rest:
												                 (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r2')))))))
		            rest: (LambcalcTupleAnfExp
				             binding: 'f'
				             values: { 
						             (LambcalcGlobAnfValue var: 'f').
						             (LambcalcVarAnfValue var: 'c').
						             (LambcalcVarAnfValue var: 'a').
						             (LambcalcVarAnfValue var: 'b') }
				             rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0))).
	self assert: result printString equals: expected printString
]

{ #category : #tests }
LambcalcClosureConversionTest >> testClosureConversionGeneric [

	| exp |
	exp := LambcalcBopAnfExp
		       binding: 'r'
		       op: LambcalcPlusOp
		       left: (LambcalcIntAnfValue val: 1)
		       right: (LambcalcVarAnfValue var: 'a')
		       rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r')).

	self assert: exp closureConvert printString equals: exp printString
]

{ #category : #tests }
LambcalcClosureConversionTest >> testFactorial5 [

	| parser node result expected |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	result := node anfConvert closureConvert.
	expected := '(LambcalcFunAnfExp binding: ''f7'' params: { ''env31''. ''g0''. } body: (LambcalcFunAnfExp binding: ''f8'' params: { ''env32''. ''x1''. } body: (LambcalcProjAnfExp binding: ''g0'' tupleName: ''env32'' index: 1 rest: (LambcalcFunAnfExp binding: ''f9'' params: { ''env33''. ''v2''. } body: (LambcalcProjAnfExp binding: ''x1'' tupleName: ''env33'' index: 1 rest: (LambcalcProjAnfExp binding: ''x134'' tupleName: ''x1'' index: 0 rest: (LambcalcAppAnfExp binding: ''r10'' funName: ''x134'' params: { (LambcalcVarAnfValue var: ''x1''). (LambcalcVarAnfValue var: ''x1''). } rest: (LambcalcProjAnfExp binding: ''r1035'' tupleName: ''r10'' index: 0 rest: (LambcalcAppAnfExp binding: ''r11'' funName: ''r1035'' params: { (LambcalcVarAnfValue var: ''r10''). (LambcalcVarAnfValue var: ''v2''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r11''))))))) rest: (LambcalcTupleAnfExp binding: ''f9'' values: { (LambcalcGlobAnfValue var: ''f9''). (LambcalcVarAnfValue var: ''x1''). } rest: (LambcalcProjAnfExp binding: ''g036'' tupleName: ''g0'' index: 0 rest: (LambcalcAppAnfExp binding: ''r12'' funName: ''g036'' params: { (LambcalcVarAnfValue var: ''g0''). (LambcalcVarAnfValue var: ''f9''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r12''))))))) rest: (LambcalcTupleAnfExp binding: ''f8'' values: { (LambcalcGlobAnfValue var: ''f8''). (LambcalcVarAnfValue var: ''g0''). } rest: (LambcalcFunAnfExp binding: ''f13'' params: { ''env37''. ''x3''. } body: (LambcalcProjAnfExp binding: ''g0'' tupleName: ''env37'' index: 1 rest: (LambcalcFunAnfExp binding: ''f14'' params: { ''env38''. ''v4''. } body: (LambcalcProjAnfExp binding: ''x3'' tupleName: ''env38'' index: 1 rest: (LambcalcProjAnfExp binding: ''x339'' tupleName: ''x3'' index: 0 rest: (LambcalcAppAnfExp binding: ''r15'' funName: ''x339'' params: { (LambcalcVarAnfValue var: ''x3''). (LambcalcVarAnfValue var: ''x3''). } rest: (LambcalcProjAnfExp binding: ''r1540'' tupleName: ''r15'' index: 0 rest: (LambcalcAppAnfExp binding: ''r16'' funName: ''r1540'' params: { (LambcalcVarAnfValue var: ''r15''). (LambcalcVarAnfValue var: ''v4''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r16''))))))) rest: (LambcalcTupleAnfExp binding: ''f14'' values: { (LambcalcGlobAnfValue var: ''f14''). (LambcalcVarAnfValue var: ''x3''). } rest: (LambcalcProjAnfExp binding: ''g041'' tupleName: ''g0'' index: 0 rest: (LambcalcAppAnfExp binding: ''r17'' funName: ''g041'' params: { (LambcalcVarAnfValue var: ''g0''). (LambcalcVarAnfValue var: ''f14''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r17''))))))) rest: (LambcalcTupleAnfExp binding: ''f13'' values: { (LambcalcGlobAnfValue var: ''f13''). (LambcalcVarAnfValue var: ''g0''). } rest: (LambcalcProjAnfExp binding: ''f842'' tupleName: ''f8'' index: 0 rest: (LambcalcAppAnfExp binding: ''r18'' funName: ''f842'' params: { (LambcalcVarAnfValue var: ''f8''). (LambcalcVarAnfValue var: ''f13''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r18'')))))))) rest: (LambcalcTupleAnfExp binding: ''f7'' values: { (LambcalcGlobAnfValue var: ''f7''). } rest: (LambcalcFunAnfExp binding: ''f19'' params: { ''env43''. ''f5''. } body: (LambcalcFunAnfExp binding: ''f20'' params: { ''env44''. ''x6''. } body: (LambcalcProjAnfExp binding: ''f5'' tupleName: ''env44'' index: 1 rest: (LambcalcJoinAnfExp binding: ''j21'' valueBinding: ''p22'' body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''p22'')) rest: (LambcalcIfAnfExp testValue: (LambcalcVarAnfValue var: ''x6'') trueExp: (LambcalcBopAnfExp binding: ''r23'' op: LambcalcMinusOp left: (LambcalcVarAnfValue var: ''x6'') right: (LambcalcIntAnfValue val: 1) rest: (LambcalcJoinAnfExp binding: ''j24'' valueBinding: ''p25'' body: (LambcalcJumpAnfExp join: ''j21'' val: (LambcalcVarAnfValue var: ''p25'')) rest: (LambcalcIfAnfExp testValue: (LambcalcVarAnfValue var: ''r23'') trueExp: (LambcalcBopAnfExp binding: ''r26'' op: LambcalcMinusOp left: (LambcalcVarAnfValue var: ''x6'') right: (LambcalcIntAnfValue val: 1) rest: (LambcalcProjAnfExp binding: ''f545'' tupleName: ''f5'' index: 0 rest: (LambcalcAppAnfExp binding: ''r27'' funName: ''f545'' params: { (LambcalcVarAnfValue var: ''f5''). (LambcalcVarAnfValue var: ''r26''). } rest: (LambcalcBopAnfExp binding: ''r28'' op: LambcalcMultOp left: (LambcalcVarAnfValue var: ''x6'') right: (LambcalcVarAnfValue var: ''r27'') rest: (LambcalcJumpAnfExp join: ''j24'' val: (LambcalcVarAnfValue var: ''r28'')))))) falseExp: (LambcalcJumpAnfExp join: ''j24'' val: (LambcalcIntAnfValue val: 1))))) falseExp: (LambcalcJumpAnfExp join: ''j21'' val: (LambcalcIntAnfValue val: 1))))) rest: (LambcalcTupleAnfExp binding: ''f20'' values: { (LambcalcGlobAnfValue var: ''f20''). (LambcalcVarAnfValue var: ''f5''). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''f20'')))) rest: (LambcalcTupleAnfExp binding: ''f19'' values: { (LambcalcGlobAnfValue var: ''f19''). } rest: (LambcalcProjAnfExp binding: ''f746'' tupleName: ''f7'' index: 0 rest: (LambcalcAppAnfExp binding: ''r29'' funName: ''f746'' params: { (LambcalcVarAnfValue var: ''f7''). (LambcalcVarAnfValue var: ''f19''). } rest: (LambcalcProjAnfExp binding: ''r2947'' tupleName: ''r29'' index: 0 rest: (LambcalcAppAnfExp binding: ''r30'' funName: ''r2947'' params: { (LambcalcVarAnfValue var: ''r29''). (LambcalcIntAnfValue val: 5). } rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: ''r30''))))))))))'.
	self assert: result printString equals: expected
]
