Class {
	#name : #LcJoin,
	#superclass : #Object,
	#instVars : [
		'binding',
		'valueBinding',
		'body'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcJoin class >> binding: aString valueBinding: aString2 body: anAnfExp [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
]

{ #category : #accessing }
LcJoin >> binding [
	^ binding
]

{ #category : #initialization }
LcJoin >> initializeBinding: aString valueBinding: aString2 body: anAnfExp [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp
]

{ #category : #'llvm lowering' }
LcJoin >> lowerWith: spills [

	| lower instrs slot |
	instrs := OrderedCollection new.
	lower := LcLower spills: spills instrs: instrs.
	body lowerWith: lower.
	valueBinding ifNotNil: [ 
		slot := spills at: binding.
		instrs addFirst: { 
				valueBinding.
				(LcLoadInsn ty: (LcPtrTy ty: LcI64Ty new) ptr: (LcIdOperand var: slot)) } ].
	^ { 
		  binding.
		  (LcBlock insns: instrs terminator: lower last) }
]

{ #category : #printing }
LcJoin >> printOn: aStream [

	| slotValue |
	aStream
		nextPutAll: '(';
		nextPutAll: self className.
	self class slots do: [ :slot | 
		aStream
			nextPutAll: ' ';
			nextPutAll: slot name;
			nextPutAll: ': '.
		slotValue := slot read: self.
		slotValue printOn: aStream ].
	aStream nextPutAll: ')'
]

{ #category : #accessing }
LcJoin >> valueBinding [
	^ valueBinding
]
