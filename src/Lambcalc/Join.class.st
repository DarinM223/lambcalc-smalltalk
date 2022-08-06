Class {
	#name : #Join,
	#superclass : #Object,
	#instVars : [
		'binding',
		'valueBinding',
		'body'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
Join class >> binding: aString valueBinding: aString2 body: anAnfExp [

	^ self new
		  initializeBinding: aString
		  valueBinding: aString2
		  body: anAnfExp
]

{ #category : #accessing }
Join >> binding [
	^ binding
]

{ #category : #initialization }
Join >> initializeBinding: aString valueBinding: aString2 body: anAnfExp [

	binding := aString.
	valueBinding := aString2.
	body := anAnfExp
]

{ #category : #'llvm lowering' }
Join >> lowerWith: spills [

	| lower instrs slot |
	instrs := OrderedCollection new.
	lower := Lower spills: spills instrs: instrs.
	body lowerWith: lower.
	valueBinding ifNotNil: [ 
		slot := spills at: binding.
		instrs addFirst: { 
				valueBinding.
				(LoadInsn ty: (PtrTy ty: I64Ty new) ptr: (IdOperand var: slot)) } ].
	^ { 
		  binding.
		  (Block insns: instrs terminator: lower last) }
]

{ #category : #printing }
Join >> printOn: aStream [

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
Join >> valueBinding [
	^ valueBinding
]
