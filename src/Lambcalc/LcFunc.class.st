Class {
	#name : #LcFunc,
	#superclass : #Object,
	#instVars : [
		'binding',
		'params',
		'entry',
		'joins'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #'as yet unclassified' }
LcFunc class >> binding: aString params: anArray entry: aJoin joins: aCollection [

	^ self new
		  initializeBinding: aString
		  params: anArray
		  entry: aJoin
		  joins: aCollection
]

{ #category : #accessing }
LcFunc >> binding [

	^ binding
]

{ #category : #accessing }
LcFunc >> entry [

	^ entry
]

{ #category : #initialization }
LcFunc >> initializeBinding: aString params: anArray entry: aJoin joins: aCollection [

	binding := aString.
	params := anArray.
	entry := aJoin.
	joins := aCollection
]

{ #category : #accessing }
LcFunc >> joins [

	^ joins
]

{ #category : #'llvm lowering' }
LcFunc >> lower [

	| spills entryBlock insns labeledBlocks |
	spills := Dictionary new.
	joins do: [ :j | 
		j valueBinding ifNotNil: [ 
			spills at: j binding put: j valueBinding , LcTemp fresh printString ] ].

	insns := OrderedCollection withAll:
		         (spills values collect: [ :spill | 
			          { 
				          spill.
				          (LcAllocaInsn ty: LcI64Ty new) } ]).
	entryBlock := (entry lowerWith: spills) at: 2.
	entryBlock insns do: [ :i | insns add: i ].
	entryBlock insns: insns.
	labeledBlocks := joins collect: [ :join | join lowerWith: spills ].
	^ { 
		  binding.
		  (LcFdecl
			   fty: LcLower fty
			   params: params
			   cfg: (LcCfg entry: entryBlock labeledBlocks: labeledBlocks)) }
]

{ #category : #accessing }
LcFunc >> params [

	^ params
]

{ #category : #printing }
LcFunc >> printArray: array on: aStream [

	aStream nextPutAll: '{'.
	array do: [ :v | 
		aStream nextPutAll: ' '.
		v printOn: aStream.
		aStream nextPutAll: '.' ].
	aStream nextPutAll: ' }'
]

{ #category : #printing }
LcFunc >> printOn: aStream [

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
		(slotValue isKindOf: OrderedCollection)
			ifTrue: [ self printOrderedCollection: slotValue on: aStream ]
			ifFalse: [ 
				slotValue isArray
					ifTrue: [ self printArray: slotValue on: aStream ]
					ifFalse: [ slotValue printOn: aStream ] ] ].
	aStream nextPutAll: ')'
]

{ #category : #printing }
LcFunc >> printOrderedCollection: aCollection on: aStream [

	aStream nextPutAll: '(OrderedCollection withAll: '.
	self printArray: aCollection asArray on: aStream.
	aStream nextPutAll: ')'
]
