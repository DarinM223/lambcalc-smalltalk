Class {
	#name : #LambcalcParser,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#classInstVars : [
		'parser'
	],
	#category : #'Lambcalc-Parser'
}

{ #category : #initialization }
LambcalcParser >> initialize [

	| expression parens parseIf keywords identifier parseLam integer |
	super initialize.
	expression := PPExpressionParser new.
	parens := $( asParser trim , expression , $) asParser trim
	          ==> [ :nodes | nodes second ].
	parseIf := 'if' asParser trim , expression , 'then' asParser trim
	           , expression , 'else' asParser trim , expression
	           ==> [ :ns | 
		           | nodes |
		           nodes := ns.
		           LambcalcIfLamNode new
			           test: (nodes at: 2);
			           trueBranch: (nodes at: 4);
			           falseBranch: (nodes at: 6) ].
	keywords := { 'if'. 'then'. 'else'. 'fn' } asSet.
	identifier := LambcalcIdentifierParser new.
	parseLam := 'fn' asParser trim , identifier , '=>' asParser trim
	            , expression ==> [ :ns | 
	            | nodes |
	            nodes := ns.
	            LambcalcLamLamNode new
		            var: (nodes at: 2);
		            body: (nodes at: 4) ].
	integer := #digit asParser plus trim ==> [ :token | 
	           LambcalcIntLamNode new
		           val: (Integer readFrom: token readStream);
		           yourself ].

	expression term: parens / parseIf / parseLam / identifier / integer.
	expression
		group: [ :g | 
			g left: #space asParser star trim do: [ :a :op :b | 
					LambcalcAppLamNode new
						lam: a;
						val: b ] ];
		group: [ :g | 
			g left: $* asParser trim do: [ :a :op :b | 
				LambcalcBopLamNode new
					op: LambcalcMultOp;
					left: a;
					right: b ] ];
		group: [ :g | 
			g left: $+ asParser trim do: [ :a :op :b | 
				LambcalcBopLamNode new
					op: LambcalcPlusOp;
					left: a;
					right: b ] ];
		group: [ :g | 
			g left: $- asParser trim do: [ :a :op :b | 
				LambcalcBopLamNode new
					op: LambcalcMinusOp;
					left: a;
					right: b ] ].

	parser := expression , #eof asParser ==> [ :nodes | nodes first ]
]

{ #category : #parsing }
LambcalcParser >> parse: aString [

	^ parser parse: aString
]
