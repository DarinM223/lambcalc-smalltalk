Class {
	#name : #LowerTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Lower-Tests'
}

{ #category : #tests }
LowerTest >> testFactorial5 [

	| parser node fns fdecls |
	Temp reset.
	parser := Parser new.
	node := parser parse:
		        '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	node alphaRename.
	fns := node anfConvert closureConvert hoist.
	fdecls := fns collect: [ :fn | fn lower ].
	self assert: fdecls equals: nil
]
