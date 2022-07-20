Class {
	#name : #ClosureConversionTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
ClosureConversionTest >> testClosureConversionApplication [

	| exp result expected |
	Temp reset.
	exp := AppAnfExp
		       binding: 'r'
		       funName: 'f'
		       params: { 
				       (VarAnfValue var: 'x').
				       (IntAnfValue val: 0) }
		       rest: (HaltAnfExp val: (VarAnfValue var: 'r')).
	result := exp closureConvert.
	expected := ProjAnfExp
		            binding: 'f0'
		            tupleName: 'f'
		            index: 0
		            rest: (AppAnfExp
				             binding: 'r'
				             funName: 'f0'
				             params: { 
						             (VarAnfValue var: 'f').
						             (VarAnfValue var: 'x').
						             (IntAnfValue val: 0) }
				             rest: (HaltAnfExp val: (VarAnfValue var: 'r'))).
	self assert: result printString equals: expected printString
]

{ #category : #tests }
ClosureConversionTest >> testClosureConversionFunction [

	| exp expected |
	Temp reset.
	exp := FunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (BopAnfExp
				        binding: 'r'
				        op: PlusOp
				        left: (VarAnfValue var: 'a')
				        right: (VarAnfValue var: 'x')
				        rest: (HaltAnfExp val: (VarAnfValue var: 'r')))
		       rest: (HaltAnfExp val: (IntAnfValue val: 0)).
	expected := FunAnfExp
		            binding: 'f'
		            params: { 'env0'. 'x' }
		            body: (ProjAnfExp
				             binding: 'a'
				             tupleName: 'env0'
				             index: 1
				             rest: (BopAnfExp
						              binding: 'r'
						              op: PlusOp
						              left: (VarAnfValue var: 'a')
						              right: (VarAnfValue var: 'x')
						              rest: (HaltAnfExp val: (VarAnfValue var: 'r'))))
		            rest: (TupleAnfExp
				             binding: 'f'
				             values: { 
						             (GlobAnfValue var: 'f').
						             (VarAnfValue var: 'a') }
				             rest: (HaltAnfExp val: (IntAnfValue val: 0))).
	self
		assert: exp closureConvert printString
		equals: expected printString
]

{ #category : #tests }
ClosureConversionTest >> testClosureConversionFunctionMultiFree [

	| exp result expected |
	Temp reset.
	exp := FunAnfExp
		       binding: 'f'
		       params: { 'x' }
		       body: (BopAnfExp
				        binding: 'r1'
				        op: PlusOp
				        left: (VarAnfValue var: 'a')
				        right: (VarAnfValue var: 'x')
				        rest: (BopAnfExp
						         binding: 'r2'
						         op: PlusOp
						         left: (VarAnfValue var: 'b')
						         right: (VarAnfValue var: 'c')
						         rest: (HaltAnfExp val: (VarAnfValue var: 'r2'))))
		       rest: (HaltAnfExp val: (IntAnfValue val: 0)).
	result := exp closureConvert.
	expected := FunAnfExp
		            binding: 'f'
		            params: { 'env0'. 'x' }
		            body: (ProjAnfExp
				             binding: 'b'
				             tupleName: 'env0'
				             index: 3
				             rest: (ProjAnfExp
						              binding: 'a'
						              tupleName: 'env0'
						              index: 2
						              rest: (ProjAnfExp
								               binding: 'c'
								               tupleName: 'env0'
								               index: 1
								               rest: (BopAnfExp
										                binding: 'r1'
										                op: PlusOp
										                left: (VarAnfValue var: 'a')
										                right: (VarAnfValue var: 'x')
										                rest: (BopAnfExp
												                 binding: 'r2'
												                 op: PlusOp
												                 left: (VarAnfValue var: 'b')
												                 right: (VarAnfValue var: 'c')
												                 rest:
												                 (HaltAnfExp val: (VarAnfValue var: 'r2')))))))
		            rest: (TupleAnfExp
				             binding: 'f'
				             values: { 
						             (GlobAnfValue var: 'f').
						             (VarAnfValue var: 'c').
						             (VarAnfValue var: 'a').
						             (VarAnfValue var: 'b') }
				             rest: (HaltAnfExp val: (IntAnfValue val: 0))).
	self assert: result printString equals: expected printString
]

{ #category : #tests }
ClosureConversionTest >> testClosureConversionGeneric [

	| exp |
	exp := BopAnfExp
		       binding: 'r'
		       op: PlusOp
		       left: (IntAnfValue val: 1)
		       right: (VarAnfValue var: 'a')
		       rest: (HaltAnfExp val: (VarAnfValue var: 'r')).

	self assert: exp closureConvert printString equals: exp printString
]

{ #category : #tests }
ClosureConversionTest >> testFactorial5 [

	| parser node result expected |
	Temp reset.
	parser := Parser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	result := node anfConvert closureConvert.
	expected := '(FunAnfExp binding: ''f7'' params: { ''env31''. ''g0''. } body: (FunAnfExp binding: ''f8'' params: { ''env32''. ''x1''. } body: (ProjAnfExp binding: ''g0'' tupleName: ''env32'' index: 1 rest: (FunAnfExp binding: ''f9'' params: { ''env33''. ''v2''. } body: (ProjAnfExp binding: ''x1'' tupleName: ''env33'' index: 1 rest: (ProjAnfExp binding: ''x134'' tupleName: ''x1'' index: 0 rest: (AppAnfExp binding: ''r10'' funName: ''x134'' params: { (VarAnfValue var: ''x1''). (VarAnfValue var: ''x1''). } rest: (ProjAnfExp binding: ''r1035'' tupleName: ''r10'' index: 0 rest: (AppAnfExp binding: ''r11'' funName: ''r1035'' params: { (VarAnfValue var: ''r10''). (VarAnfValue var: ''v2''). } rest: (HaltAnfExp val: (VarAnfValue var: ''r11''))))))) rest: (TupleAnfExp binding: ''f9'' values: { (GlobAnfValue var: ''f9''). (VarAnfValue var: ''x1''). } rest: (ProjAnfExp binding: ''g036'' tupleName: ''g0'' index: 0 rest: (AppAnfExp binding: ''r12'' funName: ''g036'' params: { (VarAnfValue var: ''g0''). (VarAnfValue var: ''f9''). } rest: (HaltAnfExp val: (VarAnfValue var: ''r12''))))))) rest: (TupleAnfExp binding: ''f8'' values: { (GlobAnfValue var: ''f8''). (VarAnfValue var: ''g0''). } rest: (FunAnfExp binding: ''f13'' params: { ''env37''. ''x3''. } body: (ProjAnfExp binding: ''g0'' tupleName: ''env37'' index: 1 rest: (FunAnfExp binding: ''f14'' params: { ''env38''. ''v4''. } body: (ProjAnfExp binding: ''x3'' tupleName: ''env38'' index: 1 rest: (ProjAnfExp binding: ''x339'' tupleName: ''x3'' index: 0 rest: (AppAnfExp binding: ''r15'' funName: ''x339'' params: { (VarAnfValue var: ''x3''). (VarAnfValue var: ''x3''). } rest: (ProjAnfExp binding: ''r1540'' tupleName: ''r15'' index: 0 rest: (AppAnfExp binding: ''r16'' funName: ''r1540'' params: { (VarAnfValue var: ''r15''). (VarAnfValue var: ''v4''). } rest: (HaltAnfExp val: (VarAnfValue var: ''r16''))))))) rest: (TupleAnfExp binding: ''f14'' values: { (GlobAnfValue var: ''f14''). (VarAnfValue var: ''x3''). } rest: (ProjAnfExp binding: ''g041'' tupleName: ''g0'' index: 0 rest: (AppAnfExp binding: ''r17'' funName: ''g041'' params: { (VarAnfValue var: ''g0''). (VarAnfValue var: ''f14''). } rest: (HaltAnfExp val: (VarAnfValue var: ''r17''))))))) rest: (TupleAnfExp binding: ''f13'' values: { (GlobAnfValue var: ''f13''). (VarAnfValue var: ''g0''). } rest: (ProjAnfExp binding: ''f842'' tupleName: ''f8'' index: 0 rest: (AppAnfExp binding: ''r18'' funName: ''f842'' params: { (VarAnfValue var: ''f8''). (VarAnfValue var: ''f13''). } rest: (HaltAnfExp val: (VarAnfValue var: ''r18'')))))))) rest: (TupleAnfExp binding: ''f7'' values: { (GlobAnfValue var: ''f7''). } rest: (FunAnfExp binding: ''f19'' params: { ''env43''. ''f5''. } body: (FunAnfExp binding: ''f20'' params: { ''env44''. ''x6''. } body: (ProjAnfExp binding: ''f5'' tupleName: ''env44'' index: 1 rest: (JoinAnfExp binding: ''j21'' valueBinding: ''p22'' body: (HaltAnfExp val: (VarAnfValue var: ''p22'')) rest: (IfAnfExp testValue: (VarAnfValue var: ''x6'') trueExp: (BopAnfExp binding: ''r23'' op: MinusOp left: (VarAnfValue var: ''x6'') right: (IntAnfValue val: 1) rest: (JoinAnfExp binding: ''j24'' valueBinding: ''p25'' body: (JumpAnfExp join: ''j21'' val: (VarAnfValue var: ''p25'')) rest: (IfAnfExp testValue: (VarAnfValue var: ''r23'') trueExp: (BopAnfExp binding: ''r26'' op: MinusOp left: (VarAnfValue var: ''x6'') right: (IntAnfValue val: 1) rest: (ProjAnfExp binding: ''f545'' tupleName: ''f5'' index: 0 rest: (AppAnfExp binding: ''r27'' funName: ''f545'' params: { (VarAnfValue var: ''f5''). (VarAnfValue var: ''r26''). } rest: (BopAnfExp binding: ''r28'' op: MultOp left: (VarAnfValue var: ''x6'') right: (VarAnfValue var: ''r27'') rest: (JumpAnfExp join: ''j24'' val: (VarAnfValue var: ''r28'')))))) falseExp: (JumpAnfExp join: ''j24'' val: (IntAnfValue val: 1))))) falseExp: (JumpAnfExp join: ''j21'' val: (IntAnfValue val: 1))))) rest: (TupleAnfExp binding: ''f20'' values: { (GlobAnfValue var: ''f20''). (VarAnfValue var: ''f5''). } rest: (HaltAnfExp val: (VarAnfValue var: ''f20'')))) rest: (TupleAnfExp binding: ''f19'' values: { (GlobAnfValue var: ''f19''). } rest: (ProjAnfExp binding: ''f746'' tupleName: ''f7'' index: 0 rest: (AppAnfExp binding: ''r29'' funName: ''f746'' params: { (VarAnfValue var: ''f7''). (VarAnfValue var: ''f19''). } rest: (ProjAnfExp binding: ''r2947'' tupleName: ''r29'' index: 0 rest: (AppAnfExp binding: ''r30'' funName: ''r2947'' params: { (VarAnfValue var: ''r29''). (IntAnfValue val: 5). } rest: (HaltAnfExp val: (VarAnfValue var: ''r30''))))))))))'.
	self assert: result printString equals: expected
]
