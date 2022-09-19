Class {
	#name : #LcAnfConvertTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LcAnfConvertTest >> testAnfConvert [

	| parser node expected |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	expected := LcFunAnfExp
		            binding: 'f7'
		            params: { 'g0' }
		            body: (LcFunAnfExp
				             binding: 'f8'
				             params: { 'x1' }
				             body: (LcFunAnfExp
						              binding: 'f9'
						              params: { 'v2' }
						              body: (LcAppAnfExp
								               binding: 'r10'
								               funName: 'x1'
								               params: { (LcVarAnfValue var: 'x1') }
								               rest: (LcAppAnfExp
										                binding: 'r11'
										                funName: 'r10'
										                params: { (LcVarAnfValue var: 'v2') }
										                rest:
										                (LcHaltAnfExp val: (LcVarAnfValue var: 'r11'))))
						              rest: (LcAppAnfExp
								               binding: 'r12'
								               funName: 'g0'
								               params: { (LcVarAnfValue var: 'f9') }
								               rest:
								               (LcHaltAnfExp val: (LcVarAnfValue var: 'r12'))))
				             rest: (LcFunAnfExp
						              binding: 'f13'
						              params: { 'x3' }
						              body: (LcFunAnfExp
								               binding: 'f14'
								               params: { 'v4' }
								               body: (LcAppAnfExp
										                binding: 'r15'
										                funName: 'x3'
										                params: { (LcVarAnfValue var: 'x3') }
										                rest: (LcAppAnfExp
												                 binding: 'r16'
												                 funName: 'r15'
												                 params: { (LcVarAnfValue var: 'v4') }
												                 rest:
												                 (LcHaltAnfExp val: (LcVarAnfValue var: 'r16'))))
								               rest: (LcAppAnfExp
										                binding: 'r17'
										                funName: 'g0'
										                params: { (LcVarAnfValue var: 'f14') }
										                rest:
										                (LcHaltAnfExp val: (LcVarAnfValue var: 'r17'))))
						              rest: (LcAppAnfExp
								               binding: 'r18'
								               funName: 'f8'
								               params: { (LcVarAnfValue var: 'f13') }
								               rest:
								               (LcHaltAnfExp val: (LcVarAnfValue var: 'r18')))))
		            rest: (LcFunAnfExp
				             binding: 'f19'
				             params: { 'f5' }
				             body: (LcFunAnfExp
						              binding: 'f20'
						              params: { 'x6' }
						              body: (LcJoinAnfExp
								               binding: 'j21'
								               valueBinding: 'p22'
								               body:
								               (LcHaltAnfExp val: (LcVarAnfValue var: 'p22'))
								               rest: (LcIfAnfExp
										                testValue: (LcVarAnfValue var: 'x6')
										                trueExp: (LcBopAnfExp
												                 binding: 'r23'
												                 op: LcMinusOp
												                 left: (LcVarAnfValue var: 'x6')
												                 right: (LcIntAnfValue val: 1)
												                 rest: (LcJoinAnfExp
														                  binding: 'j24'
														                  valueBinding: 'p25'
														                  body:
														                  (LcJumpAnfExp
															                   join: 'j21'
															                   val: (LcVarAnfValue var: 'p25'))
														                  rest: (LcIfAnfExp
																                   testValue: (LcVarAnfValue var: 'r23')
																                   trueExp: (LcBopAnfExp
																		                    binding: 'r26'
																		                    op: LcMinusOp
																		                    left: (LcVarAnfValue var: 'x6')
																		                    right: (LcIntAnfValue val: 1)
																		                    rest: (LcAppAnfExp
																				                     binding: 'r27'
																				                     funName: 'f5'
																				                     params:
																				                     { (LcVarAnfValue var: 'r26') }
																				                     rest: (LcBopAnfExp
																						                      binding: 'r28'
																						                      op: LcMultOp
																						                      left:
																						                      (LcVarAnfValue var: 'x6')
																						                      right:
																						                      (LcVarAnfValue var: 'r27')
																						                      rest:
																						                      (LcJumpAnfExp
																							                       join: 'j24'
																							                       val:
																							                       (LcVarAnfValue var: 'r28')))))
																                   falseExp:
																                   (LcJumpAnfExp
																	                    join: 'j24'
																	                    val: (LcIntAnfValue val: 1)))))
										                falseExp:
										                (LcJumpAnfExp
											                 join: 'j21'
											                 val: (LcIntAnfValue val: 1))))
						              rest: (LcHaltAnfExp val: (LcVarAnfValue var: 'f20')))
				             rest: (LcAppAnfExp
						              binding: 'r29'
						              funName: 'f7'
						              params: { (LcVarAnfValue var: 'f19') }
						              rest: (LcAppAnfExp
								               binding: 'r30'
								               funName: 'r29'
								               params: { (LcIntAnfValue val: 5) }
								               rest:
								               (LcHaltAnfExp val: (LcVarAnfValue var: 'r30'))))).
	self assert: node anfConvert printString equals: expected printString
]
