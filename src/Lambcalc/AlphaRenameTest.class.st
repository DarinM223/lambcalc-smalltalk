Class {
	#name : #AlphaRenameTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Lambda-Tests'
}

{ #category : #testing }
AlphaRenameTest >> expectedFailures [

	^ #( #testUnexpectedVarThrowsException )
]

{ #category : #tests }
AlphaRenameTest >> testFactorial5DoesntThrowException [

	| parser node |
	Temp reset.
	parser := Parser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename
]

{ #category : #tests }
AlphaRenameTest >> testRenamesVarsInLambda [

	| parser node expected |
	Temp reset.
	parser := Parser new.
	node := parser parse: '(fn a => (fn a => (fn a => a) a) a)'.
	expected := LamLamNode new
		            var: (VarLamNode new
				             var: 'a0';
				             yourself);
		            body: (AppLamNode new
				             lam: (LamLamNode new
						              var: (VarLamNode new
								               var: 'a1';
								               yourself);
						              body: (AppLamNode new
								               lam: (LamLamNode new
										                var: (VarLamNode new
												                 var: 'a2';
												                 yourself);
										                body: (VarLamNode new
												                 var: 'a2';
												                 yourself);
										                yourself);
								               val: (VarLamNode new
										                var: 'a1';
										                yourself);
								               yourself);
						              yourself);
				             val: (VarLamNode new
						              var: 'a0';
						              yourself);
				             yourself);
		            yourself.
	self
		assert: (node
				 alphaRename;
				 printString)
		equals: expected printString
]

{ #category : #tests }
AlphaRenameTest >> testUnexpectedVarThrowsException [

	| parser node |
	Temp reset.
	parser := Parser new.
	node := parser parse: 'fn a => b'.
	node alphaRename
]
