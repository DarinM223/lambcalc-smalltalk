Class {
	#name : #LambcalcAlphaRenameTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Lambda-Tests'
}

{ #category : #testing }
LambcalcAlphaRenameTest >> expectedFailures [

	^ #( #testUnexpectedVarThrowsException )
]

{ #category : #tests }
LambcalcAlphaRenameTest >> testFactorial5DoesntThrowException [

	| parser node |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename
]

{ #category : #tests }
LambcalcAlphaRenameTest >> testRenamesVarsInLambda [

	| parser node expected |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse: '(fn a => (fn a => (fn a => a) a) a)'.
	expected := LambcalcLamLamNode new
		            var: (LambcalcVarLamNode new var: 'a0');
		            body: (LambcalcAppLamNode new
				             lam: (LambcalcLamLamNode new
						              var: (LambcalcVarLamNode new var: 'a1');
						              body: (LambcalcAppLamNode new
								               lam: (LambcalcLamLamNode new
										                var: (LambcalcVarLamNode new var: 'a2');
										                body: (LambcalcVarLamNode new var: 'a2'));
								               val: (LambcalcVarLamNode new var: 'a1')));
				             val: (LambcalcVarLamNode new var: 'a0')).
	self
		assert: (node
				 alphaRename;
				 printString)
		equals: expected printString
]

{ #category : #tests }
LambcalcAlphaRenameTest >> testUnexpectedVarThrowsException [

	| parser node |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse: 'fn a => b'.
	node alphaRename
]
