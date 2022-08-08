Class {
	#name : #LambcalcJumpAnfExp,
	#superclass : #LambcalcAnfExp,
	#instVars : [
		'join',
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcJumpAnfExp class >> join: aString val: anAnfValue [

	^ self new initializeJoin: aString val: anAnfValue
]

{ #category : #'free variables' }
LambcalcJumpAnfExp >> freeVarsWith: aSet [

	^ val ifNil: [ Set empty ] ifNotNil: [ val freeVarsWith: aSet ]
]

{ #category : #initialization }
LambcalcJumpAnfExp >> initializeJoin: aString val: anAnfValue [

	join := aString.
	val := anAnfValue
]

{ #category : #accessing }
LambcalcJumpAnfExp >> join [
	^ join
]

{ #category : #'llvm lowering' }
LambcalcJumpAnfExp >> lowerWith: lower [

	lower spills at: join ifPresent: [ :slot | 
		lower instrs add: { 
				''.
				(LambcalcStoreInsn
					 ty: LambcalcI64Ty new
					 src: val lower
					 dest: (LambcalcIdOperand var: slot)) } ].
	lower last: (LambcalcBrTerminator label: join)
]
