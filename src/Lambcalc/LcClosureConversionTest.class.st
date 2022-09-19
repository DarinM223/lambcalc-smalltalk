Class {
	#name : #LcClosureConversionTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LcClosureConversionTest >> testClosureConversionApplication [

	| exp result expected |
	LcTemp reset.
	exp := LcAppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (LcVarAnfValue var: 'x').
				       (LcIntAnfValue val: 0) }
		       rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')).
	result := exp closureConvert.
	expected := LcProjAnfExp
		            binding: 'f0'
		            tupleName: 'f'
		            index: 0
		            rest: (LcAppAnfExp
				             binding: 'r'
				             funName: 'f0'
				             params: { 
						             (LcVarAnfValue var: 'f').
						             (LcVarAnfValue var: 'x').
						             (LcIntAnfValue val: 0) }
				             rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r'))).
	self assert: result printString equals: expected printString
]

{ #category : #tests }
LcClosureConversionTest >> testClosureConversionFunction [

	| exp expected |
	LcTemp reset.
	exp := LcFunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (LcBopAnfExp
				        binding: 'r'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'a')
				        right: (LcVarAnfValue var: 'x')
				        rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')))
		       rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)).
	expected := LcFunAnfExp
		            binding: 'f'
		            params: { 'env0'. 'x' }
		            body: (LcProjAnfExp
				             binding: 'a'
				             tupleName: 'env0'
				             index: 1
				             rest: (LcBopAnfExp
						              binding: 'r'
						              op: LcPlusOp
						              left: (LcVarAnfValue var: 'a')
						              right: (LcVarAnfValue var: 'x')
						              rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r'))))
		            rest: (LcTupleAnfExp
				             binding: 'f'
				             values: { 
						             (LcGlobAnfValue var: 'f').
						             (LcVarAnfValue var: 'a') }
				             rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0))).
	self
		assert: exp closureConvert printString
		equals: expected printString
]

{ #category : #tests }
LcClosureConversionTest >> testClosureConversionFunctionMultiFree [

	| exp result expected |
	LcTemp reset.
	exp := LcFunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (LcBopAnfExp
				        binding: 'r1'
				        op: LcPlusOp
				        left: (LcVarAnfValue var: 'a')
				        right: (LcVarAnfValue var: 'x')
				        rest: (LcBopAnfExp
						         binding: 'r2'
						         op: LcPlusOp
						         left: (LcVarAnfValue var: 'b')
						         right: (LcVarAnfValue var: 'c')
						         rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r2'))))
		       rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)).
	result := exp closureConvert.
	expected := LcFunAnfExp
		            binding: 'f'
		            params: { 'env0'. 'x' }
		            body: (LcProjAnfExp
				             binding: 'b'
				             tupleName: 'env0'
				             index: 3
				             rest: (LcProjAnfExp
						              binding: 'a'
						              tupleName: 'env0'
						              index: 2
						              rest: (LcProjAnfExp
								               binding: 'c'
								               tupleName: 'env0'
								               index: 1
								               rest: (LcBopAnfExp
										                binding: 'r1'
										                op: LcPlusOp
										                left: (LcVarAnfValue var: 'a')
										                right: (LcVarAnfValue var: 'x')
										                rest: (LcBopAnfExp
												                 binding: 'r2'
												                 op: LcPlusOp
												                 left: (LcVarAnfValue var: 'b')
												                 right: (LcVarAnfValue var: 'c')
												                 rest:
												                 (LcHaltAnfExp val: (LcVarAnfValue var: 'r2')))))))
		            rest: (LcTupleAnfExp
				             binding: 'f'
				             values: { 
						             (LcGlobAnfValue var: 'f').
						             (LcVarAnfValue var: 'c').
						             (LcVarAnfValue var: 'a').
						             (LcVarAnfValue var: 'b') }
				             rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0))).
	self assert: result printString equals: expected printString
]

{ #category : #tests }
LcClosureConversionTest >> testClosureConversionGeneric [

	| exp |
	exp := LcBopAnfExp
		       binding: 'r'
		       op: LcPlusOp
		       left: (LcIntAnfValue val: 1)
		       right: (LcVarAnfValue var: 'a')
		       rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'r')).

	self assert: exp closureConvert printString equals: exp printString
]

{ #category : #tests }
LcClosureConversionTest >> testFactorial5 [

	| parser node result expected |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	result := node anfConvert closureConvert.
	expected := '(LcFunAnfExp binding: ''f7'' params: { ''env31''. ''g0''. } body: (LcFunAnfExp binding: ''f8'' params: { ''env32''. ''x1''. } body: (LcProjAnfExp binding: ''g0'' tupleName: ''env32'' index: 1 rest: (LcFunAnfExp binding: ''f9'' params: { ''env33''. ''v2''. } body: (LcProjAnfExp binding: ''x1'' tupleName: ''env33'' index: 1 rest: (LcProjAnfExp binding: ''x134'' tupleName: ''x1'' index: 0 rest: (LcAppAnfExp binding: ''r10'' funName: ''x134'' params: { (LcVarAnfValue var: ''x1''). (LcVarAnfValue var: ''x1''). } rest: (LcProjAnfExp binding: ''r1035'' tupleName: ''r10'' index: 0 rest: (LcAppAnfExp binding: ''r11'' funName: ''r1035'' params: { (LcVarAnfValue var: ''r10''). (LcVarAnfValue var: ''v2''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r11''))))))) rest: (LcTupleAnfExp binding: ''f9'' values: { (LcGlobAnfValue var: ''f9''). (LcVarAnfValue var: ''x1''). } rest: (LcProjAnfExp binding: ''g036'' tupleName: ''g0'' index: 0 rest: (LcAppAnfExp binding: ''r12'' funName: ''g036'' params: { (LcVarAnfValue var: ''g0''). (LcVarAnfValue var: ''f9''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r12''))))))) rest: (LcTupleAnfExp binding: ''f8'' values: { (LcGlobAnfValue var: ''f8''). (LcVarAnfValue var: ''g0''). } rest: (LcFunAnfExp binding: ''f13'' params: { ''env37''. ''x3''. } body: (LcProjAnfExp binding: ''g0'' tupleName: ''env37'' index: 1 rest: (LcFunAnfExp binding: ''f14'' params: { ''env38''. ''v4''. } body: (LcProjAnfExp binding: ''x3'' tupleName: ''env38'' index: 1 rest: (LcProjAnfExp binding: ''x339'' tupleName: ''x3'' index: 0 rest: (LcAppAnfExp binding: ''r15'' funName: ''x339'' params: { (LcVarAnfValue var: ''x3''). (LcVarAnfValue var: ''x3''). } rest: (LcProjAnfExp binding: ''r1540'' tupleName: ''r15'' index: 0 rest: (LcAppAnfExp binding: ''r16'' funName: ''r1540'' params: { (LcVarAnfValue var: ''r15''). (LcVarAnfValue var: ''v4''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r16''))))))) rest: (LcTupleAnfExp binding: ''f14'' values: { (LcGlobAnfValue var: ''f14''). (LcVarAnfValue var: ''x3''). } rest: (LcProjAnfExp binding: ''g041'' tupleName: ''g0'' index: 0 rest: (LcAppAnfExp binding: ''r17'' funName: ''g041'' params: { (LcVarAnfValue var: ''g0''). (LcVarAnfValue var: ''f14''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r17''))))))) rest: (LcTupleAnfExp binding: ''f13'' values: { (LcGlobAnfValue var: ''f13''). (LcVarAnfValue var: ''g0''). } rest: (LcProjAnfExp binding: ''f842'' tupleName: ''f8'' index: 0 rest: (LcAppAnfExp binding: ''r18'' funName: ''f842'' params: { (LcVarAnfValue var: ''f8''). (LcVarAnfValue var: ''f13''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r18'')))))))) rest: (LcTupleAnfExp binding: ''f7'' values: { (LcGlobAnfValue var: ''f7''). } rest: (LcFunAnfExp binding: ''f19'' params: { ''env43''. ''f5''. } body: (LcFunAnfExp binding: ''f20'' params: { ''env44''. ''x6''. } body: (LcProjAnfExp binding: ''f5'' tupleName: ''env44'' index: 1 rest: (LcJoinAnfExp binding: ''j21'' valueBinding: ''p22'' body: (LcHaltAnfExp val: (LcVarAnfValue var: ''p22'')) rest: (LcIfAnfExp testValue: (LcVarAnfValue var: ''x6'') trueExp: (LcBopAnfExp binding: ''r23'' op: LcMinusOp left: (LcVarAnfValue var: ''x6'') right: (LcIntAnfValue val: 1) rest: (LcJoinAnfExp binding: ''j24'' valueBinding: ''p25'' body: (LcJumpAnfExp join: ''j21'' val: (LcVarAnfValue var: ''p25'')) rest: (LcIfAnfExp testValue: (LcVarAnfValue var: ''r23'') trueExp: (LcBopAnfExp binding: ''r26'' op: LcMinusOp left: (LcVarAnfValue var: ''x6'') right: (LcIntAnfValue val: 1) rest: (LcProjAnfExp binding: ''f545'' tupleName: ''f5'' index: 0 rest: (LcAppAnfExp binding: ''r27'' funName: ''f545'' params: { (LcVarAnfValue var: ''f5''). (LcVarAnfValue var: ''r26''). } rest: (LcBopAnfExp binding: ''r28'' op: LcMultOp left: (LcVarAnfValue var: ''x6'') right: (LcVarAnfValue var: ''r27'') rest: (LcJumpAnfExp join: ''j24'' val: (LcVarAnfValue var: ''r28'')))))) falseExp: (LcJumpAnfExp join: ''j24'' val: (LcIntAnfValue val: 1))))) falseExp: (LcJumpAnfExp join: ''j21'' val: (LcIntAnfValue val: 1))))) rest: (LcTupleAnfExp binding: ''f20'' values: { (LcGlobAnfValue var: ''f20''). (LcVarAnfValue var: ''f5''). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''f20'')))) rest: (LcTupleAnfExp binding: ''f19'' values: { (LcGlobAnfValue var: ''f19''). } rest: (LcProjAnfExp binding: ''f746'' tupleName: ''f7'' index: 0 rest: (LcAppAnfExp binding: ''r29'' funName: ''f746'' params: { (LcVarAnfValue var: ''f7''). (LcVarAnfValue var: ''f19''). } rest: (LcProjAnfExp binding: ''r2947'' tupleName: ''r29'' index: 0 rest: (LcAppAnfExp binding: ''r30'' funName: ''r2947'' params: { (LcVarAnfValue var: ''r29''). (LcIntAnfValue val: 5). } rest: (LcHaltAnfExp val: (LcVarAnfValue var: ''r30''))))))))))'.
	self assert: result printString equals: expected
]
