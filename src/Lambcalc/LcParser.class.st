Class {
	#name : #LcParser,
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
LcParser >> initialize [

	| expression parens parseIf keywords identifier parseLam integer |
	super initialize.
	expression := PPExpressionParser new.
	parens := $( asParser trim , expression , $) asParser trim
	          ==> [ :nodes | nodes second ].
	parseIf := 'if' asParser trim , expression , 'then' asParser trim
	           , expression , 'else' asParser trim , expression
	           ==> [ :nodes | 
		           LcIfLamNode new
			           test: (nodes at: 2);
			           trueBranch: (nodes at: 4);
			           falseBranch: (nodes at: 6) ].
	keywords := { 'if'. 'then'. 'else'. 'fn' } asSet.
	identifier := LcIdentifierParser new.
	parseLam := 'fn' asParser trim , identifier , '=>' asParser trim
	            , expression ==> [ :nodes | 
	            LcLamLamNode new
		            var: (nodes at: 2);
		            body: (nodes at: 4) ].
	integer := #digit asParser plus trim ==> [ :token | 
	           LcIntLamNode new val:
		           (Integer readFrom: token readStream) ].

	expression term: parens / parseIf / parseLam / identifier / integer.
	expression
		group: [ :g | 
			g left: #space asParser star trim do: [ :a :op :b | 
					LcAppLamNode new
						lam: a;
						val: b ] ];
		group: [ :g | 
			g left: $* asParser trim do: [ :a :op :b | 
				LcBopLamNode new
					op: LcMultOp;
					left: a;
					right: b ] ];
		group: [ :g | 
			g left: $+ asParser trim do: [ :a :op :b | 
				LcBopLamNode new
					op: LcPlusOp;
					left: a;
					right: b ] ];
		group: [ :g | 
			g left: $- asParser trim do: [ :a :op :b | 
				LcBopLamNode new
					op: LcMinusOp;
					left: a;
					right: b ] ].

	parser := expression , #eof asParser ==> [ :nodes | nodes first ]
]

{ #category : #parsing }
LcParser >> parse: aString [

	^ parser parse: aString
]
