Class {
	#name : #LcParserTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Parser-Tests'
}

{ #category : #tests }
LcParserTest >> testFactorial5 [

	| parser expected |
	parser := LcParser new.
	expected := LcAppLamNode new
		            lam: (LcAppLamNode new
				             lam: (LcLamLamNode new
						              var: (LcVarLamNode new var: 'g');
						              body: (LcAppLamNode new
								               lam: (LcLamLamNode new
										                var: (LcVarLamNode new var: 'x');
										                body: (LcAppLamNode new
												                 lam: (LcVarLamNode new var: 'g');
												                 val: (LcLamLamNode new
														                  var: (LcVarLamNode new var: 'v');
														                  body: (LcAppLamNode new
																                   lam: (LcAppLamNode new
																		                    lam:
																			                    (LcVarLamNode new var:
																					                     'x');
																		                    val:
																			                    (LcVarLamNode new var:
																					                     'x'));
																                   val:
																                   (LcVarLamNode new var: 'v')))));
								               val: (LcLamLamNode new
										                var: (LcVarLamNode new var: 'x');
										                body: (LcAppLamNode new
												                 lam: (LcVarLamNode new var: 'g');
												                 val: (LcLamLamNode new
														                  var: (LcVarLamNode new var: 'v');
														                  body: (LcAppLamNode new
																                   lam: (LcAppLamNode new
																		                    lam:
																			                    (LcVarLamNode new var:
																					                     'x');
																		                    val:
																			                    (LcVarLamNode new var:
																					                     'x'));
																                   val:
																                   (LcVarLamNode new var: 'v')))))));
				             val: (LcLamLamNode new
						              var: (LcVarLamNode new var: 'f');
						              body: (LcLamLamNode new
								               var: (LcVarLamNode new var: 'x');
								               body: (LcIfLamNode new
										                test: (LcVarLamNode new var: 'x');
										                trueBranch: (LcIfLamNode new
												                 test: (LcBopLamNode new
														                  op: LcMinusOp;
														                  left:
															                  (LcVarLamNode new var: 'x');
														                  right: (LcIntLamNode new val: 1));
												                 trueBranch: (LcBopLamNode new
														                  op: LcMultOp;
														                  left:
															                  (LcVarLamNode new var: 'x');
														                  right: (LcAppLamNode new
																                   lam:
																	                   (LcVarLamNode new var: 'f');
																                   val: (LcBopLamNode new
																		                    op: LcMinusOp;
																		                    left:
																			                    (LcVarLamNode new var:
																					                     'x');
																		                    right:
																			                    (LcIntLamNode new val: 1))));
												                 falseBranch:
												                 (LcIntLamNode new val: 1));
										                falseBranch: (LcIntLamNode new val: 1)))));
		            val: (LcIntLamNode new val: 5).
	self
		assert: (parser parse:
				 '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5')
				printString
		equals: expected printString
]

{ #category : #tests }
LcParserTest >> testParserArithmetic [

	| parser expected |
	parser := LcParser new.
	expected := LcBopLamNode new
		            op: LcPlusOp;
		            left: (LcIntLamNode new val: 1);
		            right: (LcAppLamNode new
				             lam: (LcBopLamNode new
						              op: LcPlusOp;
						              left: (LcIntLamNode new val: 1);
						              right: (LcIntLamNode new val: 2));
				             val: (LcBopLamNode new
						              op: LcMultOp;
						              left: (LcIntLamNode new val: 3);
						              right: (LcIntLamNode new val: 5))).
	self
		assert: (parser parse: '1 + (1 + 2) (3 * 5)') printString
		equals: expected printString
]

{ #category : #tests }
LcParserTest >> testParserIf [

	| parser expected |
	parser := LcParser new.
	expected := LcIfLamNode new
		            test: (LcIntLamNode new val: 1);
		            trueBranch: (LcIntLamNode new val: 2);
		            falseBranch: (LcIntLamNode new val: 3).
	self
		assert: (parser parse: 'if 1 then 2 else 3') printString
		equals: expected printString
]

{ #category : #tests }
LcParserTest >> testParserLam [

	| parser expected |
	parser := LcParser new.
	expected := LcAppLamNode new
		            lam: (LcLamLamNode new
				             var: (LcVarLamNode new var: 'a');
				             body: (LcBopLamNode new
						              op: LcPlusOp;
						              left: (LcVarLamNode new var: 'a');
						              right: (LcIntLamNode new val: 1)));
		            val: (LcIntLamNode new val: 1).
	self
		assert: (parser parse: '(fn a => a + 1) 1') printString
		equals: expected printString
]
