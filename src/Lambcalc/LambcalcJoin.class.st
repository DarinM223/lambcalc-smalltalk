Class {
	#name : #LambcalcJoin,
	#superclass : #Object,
	#instVars : [
		'binding',
		'valueBinding',
		'body'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LambcalcJoin class >> binding: aString valueBinding: aString2 body: anAnfExp [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
]

{ #category : #accessing }
LambcalcJoin >> binding [
	^ binding
]

{ #category : #initialization }
LambcalcJoin >> initializeBinding: aString valueBinding: aString2 body: anAnfExp [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp
]

{ #category : #'llvm lowering' }
LambcalcJoin >> lowerWith: spills [

	| lower instrs slot |
	instrs := OrderedCollection new.
	lower := LambcalcLower spills: spills instrs: instrs.
	body lowerWith: lower.
	valueBinding ifNotNil: [ 
		slot := spills at: binding.
		instrs addFirst: { 
				valueBinding.
				(LambcalcLoadInsn ty: (LambcalcPtrTy ty: LambcalcI64Ty new) ptr: (LambcalcIdOperand var: slot)) } ].
	^ { 
		  binding.
		  (LambcalcBlock insns: instrs terminator: lower last) }
]

{ #category : #printing }
LambcalcJoin >> printOn: aStream [

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
LambcalcJoin >> valueBinding [
	^ valueBinding
]
