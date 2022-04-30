Class {
	#name : #ParserTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Parser-Tests'
}

{ #category : #tests }
ParserTest >> testFactorial5 [

	| parser expected |
	parser := Parser new.
	expected := AppLamNode new
		            lam: (AppLamNode new
				             lam: (LamLamNode new
						              var: (VarLamNode new
								               var: 'g';
								               yourself);
						              body: (AppLamNode new
								               lam: (LamLamNode new
										                var: (VarLamNode new
												                 var: 'x';
												                 yourself);
										                body: (AppLamNode new
												                 lam: (VarLamNode new
														                  var: 'g';
														                  yourself);
												                 val: (LamLamNode new
														                  var: (VarLamNode new
																                   var: 'v';
																                   yourself);
														                  body: (AppLamNode new
																                   lam: (AppLamNode new
																		                    lam: (VarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    val: (VarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    yourself);
																                   val: (VarLamNode new
																		                    var: 'v';
																		                    yourself);
																                   yourself);
														                  yourself);
												                 yourself);
										                yourself);
								               val: (LamLamNode new
										                var: (VarLamNode new
												                 var: 'x';
												                 yourself);
										                body: (AppLamNode new
												                 lam: (VarLamNode new
														                  var: 'g';
														                  yourself);
												                 val: (LamLamNode new
														                  var: (VarLamNode new
																                   var: 'v';
																                   yourself);
														                  body: (AppLamNode new
																                   lam: (AppLamNode new
																		                    lam: (VarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    val: (VarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    yourself);
																                   val: (VarLamNode new
																		                    var: 'v';
																		                    yourself);
																                   yourself);
														                  yourself);
												                 yourself);
										                yourself);
								               yourself);
						              yourself);
				             val: (LamLamNode new
						              var: (VarLamNode new
								               var: 'f';
								               yourself);
						              body: (LamLamNode new
								               var: (VarLamNode new
										                var: 'x';
										                yourself);
								               body: (IfLamNode new
										                test: (VarLamNode new
												                 var: 'x';
												                 yourself);
										                trueBranch: (IfLamNode new
												                 test: (BopLamNode new
														                  op: MinusOp;
														                  left: (VarLamNode new
																                   var: 'x';
																                   yourself);
														                  right: (IntLamNode new
																                   val: 1;
																                   yourself);
														                  yourself);
												                 trueBranch: (BopLamNode new
														                  op: MultOp;
														                  left: (VarLamNode new
																                   var: 'x';
																                   yourself);
														                  right: (AppLamNode new
																                   lam: (VarLamNode new
																		                    var: 'f';
																		                    yourself);
																                   val: (BopLamNode new
																		                    op: MinusOp;
																		                    left: (VarLamNode new
																				                     var: 'x';
																				                     yourself);
																		                    right: (IntLamNode new
																				                     val: 1;
																				                     yourself);
																		                    yourself);
																                   yourself);
														                  yourself);
												                 falseBranch: (IntLamNode new
														                  val: 1;
														                  yourself);
												                 yourself);
										                falseBranch: (IntLamNode new
												                 val: 1;
												                 yourself);
										                yourself);
								               yourself);
						              yourself);
				             yourself);
		            val: (IntLamNode new
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
ParserTest >> testParserArithmetic [

	| parser expected |
	parser := Parser new.
	expected := BopLamNode new
		            op: PlusOp;
		            left: (IntLamNode new
				             val: 1;
				             yourself);
		            right: (AppLamNode new
				             lam: (BopLamNode new
						              op: PlusOp;
						              left: (IntLamNode new
								               val: 1;
								               yourself);
						              right: (IntLamNode new
								               val: 2;
								               yourself);
						              yourself);
				             val: (BopLamNode new
						              op: MultOp;
						              left: (IntLamNode new
								               val: 3;
								               yourself);
						              right: (IntLamNode new
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
ParserTest >> testParserIf [

	| parser expected |
	parser := Parser new.
	expected := IfLamNode new
		            test: (IntLamNode new
				             val: 1;
				             yourself);
		            trueBranch: (IntLamNode new
				             val: 2;
				             yourself);
		            falseBranch: (IntLamNode new
				             val: 3;
				             yourself);
		            yourself.
	self
		assert: (parser parse: 'if 1 then 2 else 3') printString
		equals: expected printString
]

{ #category : #tests }
ParserTest >> testParserLam [

	| parser expected |
	parser := Parser new.
	expected := AppLamNode new
		            lam: (LamLamNode new
				             var: (VarLamNode new
						              var: 'a';
						              yourself);
				             body: (BopLamNode new
						              op: PlusOp;
						              left: (VarLamNode new
								               var: 'a';
								               yourself);
						              right: (IntLamNode new
								               val: 1;
								               yourself);
						              yourself);
				             yourself);
		            val: (IntLamNode new
				             val: 1;
				             yourself);
		            yourself.
	self
		assert: (parser parse: '(fn a => a + 1) 1') printString
		equals: expected printString
]
