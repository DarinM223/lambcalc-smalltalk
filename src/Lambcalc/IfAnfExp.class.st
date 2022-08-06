Class {
	#name : #IfAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'testValue',
		'trueExp',
		'falseExp'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #tests }
IfAnfExp class >> testValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	^ self new
		  initializeTestValue: anAnfValue
		  trueExp: anAnfExp
		  falseExp: anAnfExp2
]

{ #category : #'free variables' }
IfAnfExp >> freeVarsWith: aSet [

	^ ((testValue freeVarsWith: aSet) union: (trueExp freeVarsWith: aSet)) 
		  union: (falseExp freeVarsWith: aSet)
]

{ #category : #hoisting }
IfAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| hoistedTrueExp hoistedFalseExp then else branchTrue branchFalse |
	hoistedTrueExp := trueExp
		                  hoistWithFunctions: functions
		                  andJoins: joins.
	hoistedFalseExp := falseExp
		                   hoistWithFunctions: functions
		                   andJoins: joins.
	then := 'then' , Temp fresh printString.
	else := 'else' , Temp fresh printString.
	branchTrue := Join
		              binding: then
		              valueBinding: nil
		              body: hoistedTrueExp.
	branchFalse := Join
		               binding: else
		               valueBinding: nil
		               body: hoistedFalseExp.
	joins
		add: branchTrue;
		add: branchFalse.
	^ IfAnfExp
		  testValue: testValue
		  trueExp: (JumpAnfExp join: then val: nil)
		  falseExp: (JumpAnfExp join: else val: nil)
]

{ #category : #initialization }
IfAnfExp >> initializeTestValue: anAnfValue trueExp: anAnfExp falseExp: anAnfExp2 [

	testValue := anAnfValue.
	trueExp := anAnfExp.
	falseExp := anAnfExp2
]

{ #category : #'llvm lowering' }
IfAnfExp >> lowerWith: lower [

	| cmp |
	cmp := 'c' , Temp fresh printString.
	lower instrs add: { 
			cmp.
			(IcmpInsn
				 cnd: 'sgt'
				 ty: I64Ty new
				 left: testValue lower
				 right: (ConstOperand val: 0)) }.
	lower last: (CbrTerminator
			 val: (IdOperand var: cmp)
			 then: trueExp join
			 else: falseExp join)
]
