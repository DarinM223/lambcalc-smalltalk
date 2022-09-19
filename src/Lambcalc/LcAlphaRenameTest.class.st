Class {
	#name : #LcAlphaRenameTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Lambda-Tests'
}

{ #category : #testing }
LcAlphaRenameTest >> expectedFailures [

	^ #( #testUnexpectedVarThrowsException )
]

{ #category : #tests }
LcAlphaRenameTest >> testFactorial5DoesntThrowException [

	| parser node |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename
]

{ #category : #tests }
LcAlphaRenameTest >> testRenamesVarsInLambda [

	| parser node expected |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse: '(fn a => (fn a => (fn a => a) a) a)'.
	expected := LcLamLamNode new
		            var: (LcVarLamNode new var: 'a0');
		            body: (LcAppLamNode new
				             lam: (LcLamLamNode new
						              var: (LcVarLamNode new var: 'a1');
						              body: (LcAppLamNode new
								               lam: (LcLamLamNode new
										                var: (LcVarLamNode new var: 'a2');
										                body: (LcVarLamNode new var: 'a2'));
								               val: (LcVarLamNode new var: 'a1')));
				             val: (LcVarLamNode new var: 'a0')).
	self
		assert: (node
				 alphaRename;
				 printString)
		equals: expected printString
]

{ #category : #tests }
LcAlphaRenameTest >> testUnexpectedVarThrowsException [

	| parser node |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse: 'fn a => b'.
	node alphaRename
]
