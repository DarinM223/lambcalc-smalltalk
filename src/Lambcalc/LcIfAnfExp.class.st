Class {
	#name : #LcIfAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'testValue',
		'trueExp',
		'falseExp'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #tests }
LcIfAnfExp class >> testValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	^ self new
		  initializeTestValue: anAnfValue
		  trueExp: anAnfExp
		  falseExp: anAnfExp2
]

{ #category : #'free variables' }
LcIfAnfExp >> freeVarsWith: aSet [

	^ ((testValue freeVarsWith: aSet) union: (trueExp freeVarsWith: aSet)) 
		  union: (falseExp freeVarsWith: aSet)
]

{ #category : #hoisting }
LcIfAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| hoistedTrueExp hoistedFalseExp then else branchTrue branchFalse |
	hoistedTrueExp := trueExp
		                  hoistWithFunctions: functions
		                  andJoins: joins.
	hoistedFalseExp := falseExp
		                   hoistWithFunctions: functions
		                   andJoins: joins.
	then := 'then' , LcTemp fresh printString.
	else := 'else' , LcTemp fresh printString.
	branchTrue := LcJoin
		              binding: then
		              valueBinding: nil
		              body: hoistedTrueExp.
	branchFalse := LcJoin
		               binding: else
		               valueBinding: nil
		               body: hoistedFalseExp.
	joins
		add: branchTrue;
		add: branchFalse.
	^ LcIfAnfExp
		  testValue: testValue
		  trueExp: (LcJumpAnfExp join: then val: nil)
		  falseExp: (LcJumpAnfExp join: else val: nil)
]

{ #category : #initialization }
LcIfAnfExp >> initializeTestValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	testValue := anAnfValue.
	trueExp := anAnfExp.
	falseExp := anAnfExp2
]

{ #category : #'llvm lowering' }
LcIfAnfExp >> lowerWith: lower [

	| cmp |
	cmp := 'c' , LcTemp fresh printString.
	lower instrs add: { 
			cmp.
			(LcIcmpInsn
				 cnd: 'sgt'
				 ty: LcI64Ty new
				 left: testValue lower
				 right: (LcConstOperand val: 0)) }.
	lower last: (LcCbrTerminator
			 val: (LcIdOperand var: cmp)
			 then: trueExp join
			 else: falseExp join)
]
