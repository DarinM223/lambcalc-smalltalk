Class {
	#name : #LambcalcAnfConvertTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
LambcalcAnfConvertTest >> testAnfConvert [

	| parser node expected |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	expected := LambcalcFunAnfExp
		            binding: 'f7'
		            params: { 'g0' }
		            body: (LambcalcFunAnfExp
				             binding: 'f8'
				             params: { 'x1' }
				             body: (LambcalcFunAnfExp
						              binding: 'f9'
						              params: { 'v2' }
						              body: (LambcalcAppAnfExp
								               binding: 'r10'
								               funName: 'x1'
								               params: { (LambcalcVarAnfValue var: 'x1') }
								               rest: (LambcalcAppAnfExp
										                binding: 'r11'
										                funName: 'r10'
										                params: { (LambcalcVarAnfValue var: 'v2') }
										                rest:
										                (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r11'))))
						              rest: (LambcalcAppAnfExp
								               binding: 'r12'
								               funName: 'g0'
								               params: { (LambcalcVarAnfValue var: 'f9') }
								               rest:
								               (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r12'))))
				             rest: (LambcalcFunAnfExp
						              binding: 'f13'
						              params: { 'x3' }
						              body: (LambcalcFunAnfExp
								               binding: 'f14'
								               params: { 'v4' }
								               body: (LambcalcAppAnfExp
										                binding: 'r15'
										                funName: 'x3'
										                params: { (LambcalcVarAnfValue var: 'x3') }
										                rest: (LambcalcAppAnfExp
												                 binding: 'r16'
												                 funName: 'r15'
												                 params: { (LambcalcVarAnfValue var: 'v4') }
												                 rest:
												                 (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r16'))))
								               rest: (LambcalcAppAnfExp
										                binding: 'r17'
										                funName: 'g0'
										                params: { (LambcalcVarAnfValue var: 'f14') }
										                rest:
										                (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r17'))))
						              rest: (LambcalcAppAnfExp
								               binding: 'r18'
								               funName: 'f8'
								               params: { (LambcalcVarAnfValue var: 'f13') }
								               rest:
								               (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r18')))))
		            rest: (LambcalcFunAnfExp
				             binding: 'f19'
				             params: { 'f5' }
				             body: (LambcalcFunAnfExp
						              binding: 'f20'
						              params: { 'x6' }
						              body: (LambcalcJoinAnfExp
								               binding: 'j21'
								               valueBinding: 'p22'
								               body:
								               (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'p22'))
								               rest: (LambcalcIfAnfExp
										                testValue: (LambcalcVarAnfValue var: 'x6')
										                trueExp: (LambcalcBopAnfExp
												                 binding: 'r23'
												                 op: LambcalcMinusOp
												                 left: (LambcalcVarAnfValue var: 'x6')
												                 right: (LambcalcIntAnfValue val: 1)
												                 rest: (LambcalcJoinAnfExp
														                  binding: 'j24'
														                  valueBinding: 'p25'
														                  body:
														                  (LambcalcJumpAnfExp
															                   join: 'j21'
															                   val: (LambcalcVarAnfValue var: 'p25'))
														                  rest: (LambcalcIfAnfExp
																                   testValue: (LambcalcVarAnfValue var: 'r23')
																                   trueExp: (LambcalcBopAnfExp
																		                    binding: 'r26'
																		                    op: LambcalcMinusOp
																		                    left: (LambcalcVarAnfValue var: 'x6')
																		                    right: (LambcalcIntAnfValue val: 1)
																		                    rest: (LambcalcAppAnfExp
																				                     binding: 'r27'
																				                     funName: 'f5'
																				                     params:
																				                     { (LambcalcVarAnfValue var: 'r26') }
																				                     rest: (LambcalcBopAnfExp
																						                      binding: 'r28'
																						                      op: LambcalcMultOp
																						                      left:
																						                      (LambcalcVarAnfValue var: 'x6')
																						                      right:
																						                      (LambcalcVarAnfValue var: 'r27')
																						                      rest:
																						                      (LambcalcJumpAnfExp
																							                       join: 'j24'
																							                       val:
																							                       (LambcalcVarAnfValue var: 'r28')))))
																                   falseExp:
																                   (LambcalcJumpAnfExp
																	                    join: 'j24'
																	                    val: (LambcalcIntAnfValue val: 1)))))
										                falseExp:
										                (LambcalcJumpAnfExp
											                 join: 'j21'
											                 val: (LambcalcIntAnfValue val: 1))))
						              rest: (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'f20')))
				             rest: (LambcalcAppAnfExp
						              binding: 'r29'
						              funName: 'f7'
						              params: { (LambcalcVarAnfValue var: 'f19') }
						              rest: (LambcalcAppAnfExp
								               binding: 'r30'
								               funName: 'r29'
								               params: { (LambcalcIntAnfValue val: 5) }
								               rest:
								               (LambcalcHaltAnfExp val: (LambcalcVarAnfValue var: 'r30'))))).
	self assert: node anfConvert printString equals: expected printString
]
