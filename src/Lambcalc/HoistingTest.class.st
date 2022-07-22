Class {
	#name : #HoistingTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Anf-Tests'
}

{ #category : #tests }
HoistingTest >> testFactorial5 [

	| parser node result expected |
	Temp reset.
	parser := Parser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	result := node anfConvert closureConvert hoist.
	expected := { 
		            { 
			            'f9'.
			            #( 'env33' 'v2' ).
			            { 
				            'entry48'.
				            nil.
				            (ProjAnfExp
					             binding: 'x1'
					             tupleName: 'env33'
					             index: 1
					             rest: (ProjAnfExp
							              binding: 'x134'
							              tupleName: 'x1'
							              index: 0
							              rest: (AppAnfExp
									               binding: 'r10'
									               funName: 'x134'
									               params: { 
											               (VarAnfValue var: 'x1').
											               (VarAnfValue var: 'x1') }
									               rest: (ProjAnfExp
											                binding: 'r1035'
											                tupleName: 'r10'
											                index: 0
											                rest: (AppAnfExp
													                 binding: 'r11'
													                 funName: 'r1035'
													                 params: { 
															                 (VarAnfValue var: 'r10').
															                 (VarAnfValue var: 'v2') }
													                 rest:
													                 (HaltAnfExp val:
														                  (VarAnfValue var: 'r11'))))))) }.
			            OrderedCollection new }.
		            { 
			            'f14'.
			            #( 'env38' 'v4' ).
			            { 
				            'entry49'.
				            nil.
				            (ProjAnfExp
					             binding: 'x3'
					             tupleName: 'env38'
					             index: 1
					             rest: (ProjAnfExp
							              binding: 'x339'
							              tupleName: 'x3'
							              index: 0
							              rest: (AppAnfExp
									               binding: 'r15'
									               funName: 'x339'
									               params: { 
											               (VarAnfValue var: 'x3').
											               (VarAnfValue var: 'x3') }
									               rest: (ProjAnfExp
											                binding: 'r1540'
											                tupleName: 'r15'
											                index: 0
											                rest: (AppAnfExp
													                 binding: 'r16'
													                 funName: 'r1540'
													                 params: { 
															                 (VarAnfValue var: 'r15').
															                 (VarAnfValue var: 'v4') }
													                 rest:
													                 (HaltAnfExp val:
														                  (VarAnfValue var: 'r16'))))))) }.
			            OrderedCollection new }.
		            { 
			            'f13'.
			            #( 'env37' 'x3' ).
			            { 
				            'entry50'.
				            nil.
				            (ProjAnfExp
					             binding: 'g0'
					             tupleName: 'env37'
					             index: 1
					             rest: (TupleAnfExp
							              binding: 'f14'
							              values: { 
									              (GlobAnfValue var: 'f14').
									              (VarAnfValue var: 'x3') }
							              rest: (ProjAnfExp
									               binding: 'g041'
									               tupleName: 'g0'
									               index: 0
									               rest: (AppAnfExp
											                binding: 'r17'
											                funName: 'g041'
											                params: { 
													                (VarAnfValue var: 'g0').
													                (VarAnfValue var: 'f14') }
											                rest:
											                (HaltAnfExp val: (VarAnfValue var: 'r17')))))) }.
			            OrderedCollection new }.
		            { 
			            'f8'.
			            #( 'env32' 'x1' ).
			            { 
				            'entry51'.
				            nil.
				            (ProjAnfExp
					             binding: 'g0'
					             tupleName: 'env32'
					             index: 1
					             rest: (TupleAnfExp
							              binding: 'f9'
							              values: { 
									              (GlobAnfValue var: 'f9').
									              (VarAnfValue var: 'x1') }
							              rest: (ProjAnfExp
									               binding: 'g036'
									               tupleName: 'g0'
									               index: 0
									               rest: (AppAnfExp
											                binding: 'r12'
											                funName: 'g036'
											                params: { 
													                (VarAnfValue var: 'g0').
													                (VarAnfValue var: 'f9') }
											                rest:
											                (HaltAnfExp val: (VarAnfValue var: 'r12')))))) }.
			            OrderedCollection new }.
		            { 
			            'f20'.
			            #( 'env44' 'x6' ).
			            { 
				            'entry56'.
				            nil.
				            (ProjAnfExp
					             binding: 'f5'
					             tupleName: 'env44'
					             index: 1
					             rest: (IfAnfExp
							              testValue: (VarAnfValue var: 'x6')
							              trueExp: (JumpAnfExp join: 'then54' val: nil)
							              falseExp: (JumpAnfExp join: 'else55' val: nil))) }.
			            (OrderedCollection withAll: { 
					             { 
						             'then52'.
						             nil.
						             (BopAnfExp
							              binding: 'r26'
							              op: MinusOp
							              left: (VarAnfValue var: 'x6')
							              right: (IntAnfValue val: 1)
							              rest: (ProjAnfExp
									               binding: 'f545'
									               tupleName: 'f5'
									               index: 0
									               rest: (AppAnfExp
											                binding: 'r27'
											                funName: 'f545'
											                params: { 
													                (VarAnfValue var: 'f5').
													                (VarAnfValue var: 'r26') }
											                rest: (BopAnfExp
													                 binding: 'r28'
													                 op: MultOp
													                 left: (VarAnfValue var: 'x6')
													                 right: (VarAnfValue var: 'r27')
													                 rest:
													                 (JumpAnfExp
														                  join: 'j24'
														                  val: (VarAnfValue var: 'r28')))))) }.
					             { 
						             'else53'.
						             nil.
						             (JumpAnfExp join: 'j24' val: (IntAnfValue val: 1)) }.
					             { 
						             'j24'.
						             'p25'.
						             (JumpAnfExp
							              join: 'j21'
							              val: (VarAnfValue var: 'p25')) }.
					             { 
						             'then54'.
						             nil.
						             (BopAnfExp
							              binding: 'r23'
							              op: MinusOp
							              left: (VarAnfValue var: 'x6')
							              right: (IntAnfValue val: 1)
							              rest: (IfAnfExp
									               testValue: (VarAnfValue var: 'r23')
									               trueExp: (JumpAnfExp join: 'then52' val: nil)
									               falseExp: (JumpAnfExp join: 'else53' val: nil))) }.
					             { 
						             'else55'.
						             nil.
						             (JumpAnfExp join: 'j21' val: (IntAnfValue val: 1)) }.
					             { 
						             'j21'.
						             'p22'.
						             (HaltAnfExp val: (VarAnfValue var: 'p22')) } }) }.
		            { 
			            'f19'.
			            #( 'env43' 'f5' ).
			            { 
				            'entry57'.
				            nil.
				            (TupleAnfExp
					             binding: 'f20'
					             values: { 
							             (GlobAnfValue var: 'f20').
							             (VarAnfValue var: 'f5') }
					             rest: (HaltAnfExp val: (VarAnfValue var: 'f20'))) }.
			            OrderedCollection new }.
		            { 
			            'f7'.
			            #( 'env31' 'g0' ).
			            { 
				            'entry58'.
				            nil.
				            (TupleAnfExp
					             binding: 'f8'
					             values: { 
							             (GlobAnfValue var: 'f8').
							             (VarAnfValue var: 'g0') }
					             rest: (TupleAnfExp
							              binding: 'f13'
							              values: { 
									              (GlobAnfValue var: 'f13').
									              (VarAnfValue var: 'g0') }
							              rest: (ProjAnfExp
									               binding: 'f842'
									               tupleName: 'f8'
									               index: 0
									               rest: (AppAnfExp
											                binding: 'r18'
											                funName: 'f842'
											                params: { 
													                (VarAnfValue var: 'f8').
													                (VarAnfValue var: 'f13') }
											                rest:
											                (HaltAnfExp val: (VarAnfValue var: 'r18')))))) }.
			            OrderedCollection new }.
		            { 
			            'main'.
			            #(  ).
			            { 
				            'entry59'.
				            nil.
				            (TupleAnfExp
					             binding: 'f7'
					             values: { (GlobAnfValue var: 'f7') }
					             rest: (TupleAnfExp
							              binding: 'f19'
							              values: { (GlobAnfValue var: 'f19') }
							              rest: (ProjAnfExp
									               binding: 'f746'
									               tupleName: 'f7'
									               index: 0
									               rest: (AppAnfExp
											                binding: 'r29'
											                funName: 'f746'
											                params: { 
													                (VarAnfValue var: 'f7').
													                (VarAnfValue var: 'f19') }
											                rest: (ProjAnfExp
													                 binding: 'r2947'
													                 tupleName: 'r29'
													                 index: 0
													                 rest: (AppAnfExp
															                  binding: 'r30'
															                  funName: 'r2947'
															                  params: { 
																	                  (VarAnfValue var: 'r29').
																	                  (IntAnfValue val: 5) }
															                  rest:
															                  (HaltAnfExp val:
																                   (VarAnfValue var: 'r30')))))))) }.
			            OrderedCollection new } }.

	self assert: result asArray printString equals: expected printString
]
