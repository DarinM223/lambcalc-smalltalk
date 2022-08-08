Class {
	#name : #LambcalcIfAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'testValue',
		'trueExp',
		'falseExp'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #tests }
LambcalcIfAnfExp class >> testValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	^ self new
		  initializeTestValue: anAnfValue
		  trueExp: anAnfExp
		  falseExp: anAnfExp2
]

{ #category : #'free variables' }
LambcalcIfAnfExp >> freeVarsWith: aSet [

	^ ((testValue freeVarsWith: aSet) union: (trueExp freeVarsWith: aSet)) 
		  union: (falseExp freeVarsWith: aSet)
]

{ #category : #hoisting }
LambcalcIfAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| hoistedTrueExp hoistedFalseExp then else branchTrue branchFalse |
	hoistedTrueExp := trueExp
		                  hoistWithFunctions: functions
		                  andJoins: joins.
	hoistedFalseExp := falseExp
		                   hoistWithFunctions: functions
		                   andJoins: joins.
	then := 'then' , LambcalcTemp fresh printString.
	else := 'else' , LambcalcTemp fresh printString.
	branchTrue := LambcalcJoin
		              binding: then
		              valueBinding: nil
		              body: hoistedTrueExp.
	branchFalse := LambcalcJoin
		               binding: else
		               valueBinding: nil
		               body: hoistedFalseExp.
	joins
		add: branchTrue;
		add: branchFalse.
	^ LambcalcIfAnfExp
		  testValue: testValue
		  trueExp: (LambcalcJumpAnfExp join: then val: nil)
		  falseExp: (LambcalcJumpAnfExp join: else val: nil)
]

{ #category : #initialization }
LambcalcIfAnfExp >> initializeTestValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	testValue := anAnfValue.
	trueExp := anAnfExp.
	falseExp := anAnfExp2
]

{ #category : #'llvm lowering' }
LambcalcIfAnfExp >> lowerWith: lower [

	| cmp |
	cmp := 'c' , LambcalcTemp fresh printString.
	lower instrs add: { 
			cmp.
			(LambcalcIcmpInsn
				 cnd: 'sgt'
				 ty: LambcalcI64Ty new
				 left: testValue lower
				 right: (LambcalcConstOperand val: 0)) }.
	lower last: (LambcalcCbrTerminator
			 val: (LambcalcIdOperand var: cmp)
			 then: trueExp join
			 else: falseExp join)
]
