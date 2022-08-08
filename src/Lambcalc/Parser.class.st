Class {
	#name : #Parser,
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
Parser >> initialize [

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
		           IfLamNode new
			           test: (nodes at: 2);
			           trueBranch: (nodes at: 4);
			           falseBranch: (nodes at: 6) ].
	keywords := { 'if'. 'then'. 'else'. 'fn' } asSet.
	identifier := IdentifierParser new.
	parseLam := 'fn' asParser trim , identifier , '=>' asParser trim
	            , expression ==> [ :ns | 
	            | nodes |
	            nodes := ns.
	            LamLamNode new
		            var: (nodes at: 2);
		            body: (nodes at: 4) ].
	integer := #digit asParser plus trim ==> [ :token | 
	           IntLamNode new
		           val: (Integer readFrom: token readStream);
		           yourself ].

	expression term: parens / parseIf / parseLam / identifier / integer.
	expression
		group: [ :g | 
			g left: #space asParser star trim do: [ :a :op :b | 
					AppLamNode new
						lam: a;
						val: b ] ];
		group: [ :g | 
			g left: $* asParser trim do: [ :a :op :b | 
				BopLamNode new
					op: MultOp;
					left: a;
					right: b ] ];
		group: [ :g | 
			g left: $+ asParser trim do: [ :a :op :b | 
				BopLamNode new
					op: PlusOp;
					left: a;
					right: b ] ];
		group: [ :g | 
			g left: $- asParser trim do: [ :a :op :b | 
				BopLamNode new
					op: MinusOp;
					left: a;
					right: b ] ].

	parser := expression , #eof asParser ==> [ :nodes | nodes first ]
]

{ #category : #parsing }
Parser >> parse: aString [

	^ parser parse: aString
]
