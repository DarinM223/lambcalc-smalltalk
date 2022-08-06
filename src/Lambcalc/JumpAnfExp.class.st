Class {
	#name : #JumpAnfExp,
	#superclass : #AnfExp,
	#instVars : [
		'join',
		'val'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
JumpAnfExp class >> join: aString val: anAnfValue [

	^ self new initializeJoin: aString val: anAnfValue
]

{ #category : #'free variables' }
JumpAnfExp >> freeVarsWith: aSet [

	^ val ifNil: [ Set empty ] ifNotNil: [ val freeVarsWith: aSet ]
]

{ #category : #initialization }
JumpAnfExp >> initializeJoin: aString val: anAnfValue [

	join := aString.
	val := anAnfValue
]

{ #category : #accessing }
JumpAnfExp >> join [
	^ join
]

{ #category : #'llvm lowering' }
JumpAnfExp >> lowerWith: lower [

	lower spills at: join ifPresent: [ :slot | 
		lower instrs add: { 
				''.
				(StoreInsn
					 ty: I64Ty new
					 src: val lower
					 dest: (IdOperand var: slot)) } ].
	lower last: (BrTerminator label: join)
]
