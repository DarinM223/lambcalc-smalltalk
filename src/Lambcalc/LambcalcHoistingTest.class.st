Class {
	#name : #LambcalcHoistingTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LambcalcHoistingTest >> testFactorial5 [

	| parser node result expected |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	result := node anfConvert closureConvert hoist.
	expected := { 
		            (LambcalcFunc
			             binding: 'f9'
			             params: { 'env33'. 'v2' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry48'
					              valueBinding: nil
					              body: (LambcalcProjAnfExp
							               binding: 'x1'
							               tupleName: 'env33'
							               index: 1
							               rest: (LambcalcProjAnfExp
									                binding: 'x134'
									                tupleName: 'x1'
									                index: 0
									                rest: (LambcalcAppAnfExp
											                 binding: 'r10'
											                 funName: 'x134'
											                 params: { 
													                 (LambcalcVarAnfValue var: 'x1').
													                 (LambcalcVarAnfValue var: 'x1') }
											                 rest: (LambcalcProjAnfExp
													                  binding: 'r1035'
													                  tupleName: 'r10'
													                  index: 0
													                  rest: (LambcalcAppAnfExp
															                   binding: 'r11'
															                   funName: 'r1035'
															                   params: { 
																	                   (LambcalcVarAnfValue var: 'r10').
																	                   (LambcalcVarAnfValue var: 'v2') }
															                   rest:
															                   (LambcalcHaltAnfExp val:
																                    (LambcalcVarAnfValue var: 'r11'))))))))
			             joins: (OrderedCollection withAll: {  })).
		            (LambcalcFunc
			             binding: 'f14'
			             params: { 'env38'. 'v4' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry49'
					              valueBinding: nil
					              body: (LambcalcProjAnfExp
							               binding: 'x3'
							               tupleName: 'env38'
							               index: 1
							               rest: (LambcalcProjAnfExp
									                binding: 'x339'
									                tupleName: 'x3'
									                index: 0
									                rest: (LambcalcAppAnfExp
											                 binding: 'r15'
											                 funName: 'x339'
											                 params: { 
													                 (LambcalcVarAnfValue var: 'x3').
													                 (LambcalcVarAnfValue var: 'x3') }
											                 rest: (LambcalcProjAnfExp
													                  binding: 'r1540'
													                  tupleName: 'r15'
													                  index: 0
													                  rest: (LambcalcAppAnfExp
															                   binding: 'r16'
															                   funName: 'r1540'
															                   params: { 
																	                   (LambcalcVarAnfValue var: 'r15').
																	                   (LambcalcVarAnfValue var: 'v4') }
															                   rest:
															                   (LambcalcHaltAnfExp val:
																                    (LambcalcVarAnfValue var: 'r16'))))))))
			             joins: (OrderedCollection withAll: {  })).
		            (LambcalcFunc
			             binding: 'f13'
			             params: { 'env37'. 'x3' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry50'
					              valueBinding: nil
					              body: (LambcalcProjAnfExp
							               binding: 'g0'
							               tupleName: 'env37'
							               index: 1
							               rest: (LambcalcTupleAnfExp
									                binding: 'f14'
									                values: { 
											                (LambcalcGlobAnfValue var: 'f14').
											                (LambcalcVarAnfValue var: 'x3') }
									                rest: (LambcalcProjAnfExp
											                 binding: 'g041'
											                 tupleName: 'g0'
											                 index: 0
											                 rest: (LambcalcAppAnfExp
													                  binding: 'r17'
													                  funName: 'g041'
													                  params: { 
															                  (LambcalcVarAnfValue var: 'g0').
															                  (LambcalcVarAnfValue var: 'f14') }
													                  rest:
													                  (LambcalcHaltAnfExp val:
														                   (LambcalcVarAnfValue var: 'r17')))))))
			             joins: (OrderedCollection withAll: {  })).
		            (LambcalcFunc
			             binding: 'f8'
			             params: { 'env32'. 'x1' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry51'
					              valueBinding: nil
					              body: (LambcalcProjAnfExp
							               binding: 'g0'
							               tupleName: 'env32'
							               index: 1
							               rest: (LambcalcTupleAnfExp
									                binding: 'f9'
									                values: { 
											                (LambcalcGlobAnfValue var: 'f9').
											                (LambcalcVarAnfValue var: 'x1') }
									                rest: (LambcalcProjAnfExp
											                 binding: 'g036'
											                 tupleName: 'g0'
											                 index: 0
											                 rest: (LambcalcAppAnfExp
													                  binding: 'r12'
													                  funName: 'g036'
													                  params: { 
															                  (LambcalcVarAnfValue var: 'g0').
															                  (LambcalcVarAnfValue var: 'f9') }
													                  rest:
													                  (LambcalcHaltAnfExp val:
														                   (LambcalcVarAnfValue var: 'r12')))))))
			             joins: (OrderedCollection withAll: {  })).
		            (LambcalcFunc
			             binding: 'f20'
			             params: { 'env44'. 'x6' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry56'
					              valueBinding: nil
					              body: (LambcalcProjAnfExp
							               binding: 'f5'
							               tupleName: 'env44'
							               index: 1
							               rest: (LambcalcIfAnfExp
									                testValue: (LambcalcVarAnfValue var: 'x6')
									                trueExp: (LambcalcJumpAnfExp join: 'then54' val: nil)
									                falseExp:
									                (LambcalcJumpAnfExp join: 'else55' val: nil))))
			             joins: (OrderedCollection withAll: { 
						              (LambcalcJoin
							               binding: 'then52'
							               valueBinding: nil
							               body: (LambcalcBopAnfExp
									                binding: 'r26'
									                op: LambcalcMinusOp
									                left: (LambcalcVarAnfValue var: 'x6')
									                right: (LambcalcIntAnfValue val: 1)
									                rest: (LambcalcProjAnfExp
											                 binding: 'f545'
											                 tupleName: 'f5'
											                 index: 0
											                 rest: (LambcalcAppAnfExp
													                  binding: 'r27'
													                  funName: 'f545'
													                  params: { 
															                  (LambcalcVarAnfValue var: 'f5').
															                  (LambcalcVarAnfValue var: 'r26') }
													                  rest: (LambcalcBopAnfExp
															                   binding: 'r28'
															                   op: LambcalcMultOp
															                   left: (LambcalcVarAnfValue var: 'x6')
															                   right: (LambcalcVarAnfValue var: 'r27')
															                   rest:
															                   (LambcalcJumpAnfExp
																                    join: 'j24'
																                    val: (LambcalcVarAnfValue var: 'r28'))))))).
						              (LambcalcJoin
							               binding: 'else53'
							               valueBinding: nil
							               body:
							               (LambcalcJumpAnfExp
								                join: 'j24'
								                val: (LambcalcIntAnfValue val: 1))).
						              (LambcalcJoin
							               binding: 'j24'
							               valueBinding: 'p25'
							               body:
							               (LambcalcJumpAnfExp
								                join: 'j21'
								                val: (LambcalcVarAnfValue var: 'p25'))).
						              (LambcalcJoin
							               binding: 'then54'
							               valueBinding: nil
							               body: (LambcalcBopAnfExp
									                binding: 'r23'
									                op: LambcalcMinusOp
									                left: (LambcalcVarAnfValue var: 'x6')
									                right: (LambcalcIntAnfValue val: 1)
									                rest: (LambcalcIfAnfExp
											                 testValue: (LambcalcVarAnfValue var: 'r23')
											                 trueExp:
											                 (LambcalcJumpAnfExp join: 'then52' val: nil)
											                 falseExp:
											                 (LambcalcJumpAnfExp join: 'else53' val: nil)))).
						              (LambcalcJoin
							               binding: 'else55'
							               valueBinding: nil
							               body:
							               (LambcalcJumpAnfExp
								                join: 'j21'
								                val: (LambcalcIntAnfValue val: 1))).
						              (LambcalcJoin
							               binding: 'j21'
							               valueBinding: 'p22'
							               body: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'p22'))) })).
		            (LambcalcFunc
			             binding: 'f19'
			             params: { 'env43'. 'f5' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry57'
					              valueBinding: nil
					              body: (LambcalcTupleAnfExp
							               binding: 'f20'
							               values: { 
									               (LambcalcGlobAnfValue var: 'f20').
									               (LambcalcVarAnfValue var: 'f5') }
							               rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'f20'))))
			             joins: (OrderedCollection withAll: {  })).
		            (LambcalcFunc
			             binding: 'f7'
			             params: { 'env31'. 'g0' }
			             entry:
				             (LambcalcJoin
					              binding: 'entry58'
					              valueBinding: nil
					              body: (LambcalcTupleAnfExp
							               binding: 'f8'
							               values: { 
									               (LambcalcGlobAnfValue var: 'f8').
									               (LambcalcVarAnfValue var: 'g0') }
							               rest: (LambcalcTupleAnfExp
									                binding: 'f13'
									                values: { 
											                (LambcalcGlobAnfValue var: 'f13').
											                (LambcalcVarAnfValue var: 'g0') }
									                rest: (LambcalcProjAnfExp
											                 binding: 'f842'
											                 tupleName: 'f8'
											                 index: 0
											                 rest: (LambcalcAppAnfExp
													                  binding: 'r18'
													                  funName: 'f842'
													                  params: { 
															                  (LambcalcVarAnfValue var: 'f8').
															                  (LambcalcVarAnfValue var: 'f13') }
													                  rest:
													                  (LambcalcHaltAnfExp val:
														                   (LambcalcVarAnfValue var: 'r18')))))))
			             joins: (OrderedCollection withAll: {  })).
		            (LambcalcFunc
			             binding: 'main'
			             params: {  }
			             entry:
				             (LambcalcJoin
					              binding: 'entry59'
					              valueBinding: nil
					              body: (LambcalcTupleAnfExp
							               binding: 'f7'
							               values: { (LambcalcGlobAnfValue var: 'f7') }
							               rest: (LambcalcTupleAnfExp
									                binding: 'f19'
									                values: { (LambcalcGlobAnfValue var: 'f19') }
									                rest: (LambcalcProjAnfExp
											                 binding: 'f746'
											                 tupleName: 'f7'
											                 index: 0
											                 rest: (LambcalcAppAnfExp
													                  binding: 'r29'
													                  funName: 'f746'
													                  params: { 
															                  (LambcalcVarAnfValue var: 'f7').
															                  (LambcalcVarAnfValue var: 'f19') }
													                  rest: (LambcalcProjAnfExp
															                   binding: 'r2947'
															                   tupleName: 'r29'
															                   index: 0
															                   rest: (LambcalcAppAnfExp
																	                    binding: 'r30'
																	                    funName: 'r2947'
																	                    params: { 
																			                    (LambcalcVarAnfValue var: 'r29').
																			                    (LambcalcIntAnfValue val: 5) }
																	                    rest:
																	                    (LambcalcHaltAnfExp val:
																		                     (LambcalcVarAnfValue var: 'r30')))))))))
			             joins: (OrderedCollection withAll: {  })) }.

	self assert: result asArray printString equals: expected printString
]
