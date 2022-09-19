Class {
	#name : #LcJumpAnfExp,
	#superclass : #LcAnfExp,
	#instVars : [
		'join',
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcJumpAnfExp class >> join: aString val: anAnfValue [

	^ self new initializeJoin: aString val: anAnfValue
]

{ #category : #'free variables' }
LcJumpAnfExp >> freeVarsWith: aSet [

	^ val ifNil: [ Set empty ] ifNotNil: [ val freeVarsWith: aSet ]
]

{ #category : #initialization }
LcJumpAnfExp >> initializeJoin: aString val: anAnfValue [

	join := aString.
	val := anAnfValue
]

{ #category : #accessing }
LcJumpAnfExp >> join [
	^ join
]

{ #category : #'llvm lowering' }
LcJumpAnfExp >> lowerWith: lower [

	lower spills at: join ifPresent: [ :slot | 
		lower instrs add: { 
				''.
				(LcStoreInsn
					 ty: LcI64Ty new
					 src: val lower
					 dest: (LcIdOperand var: slot)) } ].
	lower last: (LcBrTerminator label: join)
]
