Class {
	#name : #LambcalcParserTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Parser-Tests'
}

{ #category : #tests }
LambcalcParserTest >> testFactorial5 [

	| parser expected |
	parser := LambcalcParser new.
	expected := LambcalcAppLamNode new
		            lam: (LambcalcAppLamNode new
				             lam: (LambcalcLamLamNode new
						              var: (LambcalcVarLamNode new
								               var: 'g';
								               yourself);
						              body: (LambcalcAppLamNode new
								               lam: (LambcalcLamLamNode new
										                var: (LambcalcVarLamNode new
												                 var: 'x';
												                 yourself);
										                body: (LambcalcAppLamNode new
												                 lam: (LambcalcVarLamNode new
														                  var: 'g';
														                  yourself);
												                 val: (LambcalcLamLamNode new
														                  var: (LambcalcVarLamNode new
																                   var: 'v';
																                   yourself);
														                  body: (LambcalcAppLamNode new
																                   lam: (LambcalcAppLamNode new
																		                    lam: (LambcalcVarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    val: (LambcalcVarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    yourself);
																                   val: (LambcalcVarLamNode new
																		                    var: 'v';
																		                    yourself);
																                   yourself);
														                  yourself);
												                 yourself);
										                yourself);
								               val: (LambcalcLamLamNode new
										                var: (LambcalcVarLamNode new
												                 var: 'x';
												                 yourself);
										                body: (LambcalcAppLamNode new
												                 lam: (LambcalcVarLamNode new
														                  var: 'g';
														                  yourself);
												                 val: (LambcalcLamLamNode new
														                  var: (LambcalcVarLamNode new
																                   var: 'v';
																                   yourself);
														                  body: (LambcalcAppLamNode new
																                   lam: (LambcalcAppLamNode new
																		                    lam: (LambcalcVarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    val: (LambcalcVarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    yourself);
																                   val: (LambcalcVarLamNode new
																		                    var: 'v';
																		                    yourself);
																                   yourself);
														                  yourself);
												                 yourself);
										                yourself);
								               yourself);
						              yourself);
				             val: (LambcalcLamLamNode new
						              var: (LambcalcVarLamNode new
								               var: 'f';
								               yourself);
						              body: (LambcalcLamLamNode new
								               var: (LambcalcVarLamNode new
										                var: 'x';
										                yourself);
								               body: (LambcalcIfLamNode new
										                test: (LambcalcVarLamNode new
												                 var: 'x';
												                 yourself);
										                trueBranch: (LambcalcIfLamNode new
												                 test: (LambcalcBopLamNode new
														                  op: LambcalcMinusOp;
														                  left: (LambcalcVarLamNode new
																                   var: 'x';
																                   yourself);
														                  right: (LambcalcIntLamNode new
																                   val: 1;
																                   yourself);
														                  yourself);
												                 trueBranch: (LambcalcBopLamNode new
														                  op: LambcalcMultOp;
														                  left: (LambcalcVarLamNode new
																                   var: 'x';
																                   yourself);
														                  right: (LambcalcAppLamNode new
																                   lam: (LambcalcVarLamNode new
																		                    var: 'f';
																		                    yourself);
																                   val: (LambcalcBopLamNode new
																		                    op: LambcalcMinusOp;
																		                    left: (LambcalcVarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    right: (LambcalcIntLamNode new
																				                     val: 1;
																				                     yourself);
																		                    yourself);
																                   yourself);
														                  yourself);
												                 falseBranch: (LambcalcIntLamNode new
														                  val: 1;
														                  yourself);
												                 yourself);
										                falseBranch: (LambcalcIntLamNode new
												                 val: 1;
												                 yourself);
										                yourself);
								               yourself);
						              yourself);
				             yourself);
		            val: (LambcalcIntLamNode new
				             val: 5;
				             yourself);
		            yourself.
	self
		assert: (parser parse:
				 '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5')
				printString
		equals: expected printString
]

{ #category : #tests }
LambcalcParserTest >> testParserArithmetic [

	| parser expected |
	parser := LambcalcParser new.
	expected := LambcalcBopLamNode new
		            op: LambcalcPlusOp;
		            left: (LambcalcIntLamNode new
				             val: 1;
				             yourself);
		            right: (LambcalcAppLamNode new
				             lam: (LambcalcBopLamNode new
						              op: LambcalcPlusOp;
						              left: (LambcalcIntLamNode new
								               val: 1;
								               yourself);
						              right: (LambcalcIntLamNode new
								               val: 2;
								               yourself);
						              yourself);
				             val: (LambcalcBopLamNode new
						              op: LambcalcMultOp;
						              left: (LambcalcIntLamNode new
								               val: 3;
								               yourself);
						              right: (LambcalcIntLamNode new
								               val: 5;
								               yourself);
						              yourself);
				             yourself);
		            yourself.
	self
		assert: (parser parse: '1 + (1 + 2) (3 * 5)') printString
		equals: expected printString
]

{ #category : #tests }
LambcalcParserTest >> testParserIf [

	| parser expected |
	parser := LambcalcParser new.
	expected := LambcalcIfLamNode new
		            test: (LambcalcIntLamNode new
				             val: 1;
				             yourself);
		            trueBranch: (LambcalcIntLamNode new
				             val: 2;
				             yourself);
		            falseBranch: (LambcalcIntLamNode new
				             val: 3;
				             yourself);
		            yourself.
	self
		assert: (parser parse: 'if 1 then 2 else 3') printString
		equals: expected printString
]

{ #category : #tests }
LambcalcParserTest >> testParserLam [

	| parser expected |
	parser := LambcalcParser new.
	expected := LambcalcAppLamNode new
		            lam: (LambcalcLamLamNode new
				             var: (LambcalcVarLamNode new
						              var: 'a';
						              yourself);
				             body: (LambcalcBopLamNode new
						              op: LambcalcPlusOp;
						              left: (LambcalcVarLamNode new
								               var: 'a';
								               yourself);
						              right: (LambcalcIntLamNode new
								               val: 1;
								               yourself);
						              yourself);
				             yourself);
		            val: (LambcalcIntLamNode new
				             val: 1;
				             yourself);
		            yourself.
	self
		assert: (parser parse: '(fn a => a + 1) 1') printString
		equals: expected printString
]
