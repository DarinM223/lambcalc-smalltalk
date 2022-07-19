Class {
	#name : #AnfConvertTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
AnfConvertTest >> testAnfConvert [

	| parser node expected |
	Temp reset.
	parser := Parser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	expected := FunAnfExp
		            binding: 'f7'
		            params: { 'g0' }
		            body: (FunAnfExp
				             binding: 'f8'
				             params: { 'x1' }
				             body: (FunAnfExp
						              binding: 'f9'
						              params: { 'v2' }
						              body: (AppAnfExp
								               binding: 'r10'
								               funName: (VarAnfValue var: 'x1')
								               params: { (VarAnfValue var: 'x1') }
								               rest: (AppAnfExp
										                binding: 'r11'
										                funName: (VarAnfValue var: 'r10')
										                params: { (VarAnfValue var: 'v2') }
										                rest:
										                (HaltAnfExp val: (VarAnfValue var: 'r11'))))
						              rest: (AppAnfExp
								               binding: 'r12'
								               funName: (VarAnfValue var: 'g0')
								               params: { (VarAnfValue var: 'f9') }
								               rest:
								               (HaltAnfExp val: (VarAnfValue var: 'r12'))))
				             rest: (FunAnfExp
						              binding: 'f13'
						              params: { 'x3' }
						              body: (FunAnfExp
								               binding: 'f14'
								               params: { 'v4' }
								               body: (AppAnfExp
										                binding: 'r15'
										                funName: (VarAnfValue var: 'x3')
										                params: { (VarAnfValue var: 'x3') }
										                rest: (AppAnfExp
												                 binding: 'r16'
												                 funName: (VarAnfValue var: 'r15')
												                 params: { (VarAnfValue var: 'v4') }
												                 rest:
												                 (HaltAnfExp val: (VarAnfValue var: 'r16'))))
								               rest: (AppAnfExp
										                binding: 'r17'
										                funName: (VarAnfValue var: 'g0')
										                params: { (VarAnfValue var: 'f14') }
										                rest:
										                (HaltAnfExp val: (VarAnfValue var: 'r17'))))
						              rest: (AppAnfExp
								               binding: 'r18'
								               funName: (VarAnfValue var: 'f8')
								               params: { (VarAnfValue var: 'f13') }
								               rest:
								               (HaltAnfExp val: (VarAnfValue var: 'r18')))))
		            rest: (FunAnfExp
				             binding: 'f19'
				             params: { 'f5' }
				             body: (FunAnfExp
						              binding: 'f20'
						              params: { 'x6' }
						              body: (JoinAnfExp
								               binding: 'j21'
								               valueBinding: 'p22'
								               body:
								               (HaltAnfExp val: (VarAnfValue var: 'p22'))
								               rest: (IfAnfExp
										                testValue: (VarAnfValue var: 'x6')
										                trueExp: (BopAnfExp
												                 binding: 'r23'
												                 op: MinusOp
												                 left: (VarAnfValue var: 'x6')
												                 right: (IntAnfValue val: 1)
												                 rest: (JoinAnfExp
														                  binding: 'j24'
														                  valueBinding: 'p25'
														                  body:
														                  (JumpAnfExp
															                   join: 'j21'
															                   val: (VarAnfValue var: 'p25'))
														                  rest: (IfAnfExp
																                   testValue: (VarAnfValue var: 'r23')
																                   trueExp: (BopAnfExp
																		                    binding: 'r26'
																		                    op: MinusOp
																		                    left: (VarAnfValue var: 'x6')
																		                    right: (IntAnfValue val: 1)
																		                    rest: (AppAnfExp
																				                     binding: 'r27'
																				                     funName:
																				                     (VarAnfValue var: 'f5')
																				                     params:
																				                     { (VarAnfValue var: 'r26') }
																				                     rest: (BopAnfExp
																						                      binding: 'r28'
																						                      op: MultOp
																						                      left:
																						                      (VarAnfValue var: 'x6')
																						                      right:
																						                      (VarAnfValue var: 'r27')
																						                      rest:
																						                      (JumpAnfExp
																							                       join: 'j24'
																							                       val:
																							                       (VarAnfValue var: 'r28')))))
																                   falseExp:
																                   (JumpAnfExp
																	                    join: 'j24'
																	                    val: (IntAnfValue val: 1)))))
										                falseExp:
										                (JumpAnfExp
											                 join: 'j21'
											                 val: (IntAnfValue val: 1))))
						              rest: (HaltAnfExp val: (VarAnfValue var: 'f20')))
				             rest: (AppAnfExp
						              binding: 'r29'
						              funName: (VarAnfValue var: 'f7')
						              params: { (VarAnfValue var: 'f19') }
						              rest: (AppAnfExp
								               binding: 'r30'
								               funName: (VarAnfValue var: 'r29')
								               params: { (IntAnfValue val: 5) }
								               rest:
								               (HaltAnfExp val: (VarAnfValue var: 'r30'))))).
	self assert: node anfConvert printString equals: expected printString
]
