Class {
	#name : #LambcalcFunc,
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
LambcalcFunc class >> binding: aString params: anArray entry: aJoin joins: aCollection [

	^ self new
		  initializeBinding: aString
		  params: anArray
		  entry: aJoin
		  joins: aCollection
]

{ #category : #accessing }
LambcalcFunc >> binding [

	^ binding
]

{ #category : #accessing }
LambcalcFunc >> entry [

	^ entry
]

{ #category : #initialization }
LambcalcFunc >> initializeBinding: aString params: anArray entry: aJoin joins: aCollection [

	binding := aString.
	params := anArray.
	entry := aJoin.
	joins := aCollection
]

{ #category : #accessing }
LambcalcFunc >> joins [

	^ joins
]

{ #category : #'llvm lowering' }
LambcalcFunc >> lower [

	| spills entryBlock insns labeledBlocks |
	spills := Dictionary new.
	joins do: [ :j | 
		j valueBinding ifNotNil: [ 
			spills at: j binding put: j valueBinding , LambcalcTemp fresh printString ] ].

	insns := OrderedCollection withAll:
		         (spills values collect: [ :spill | 
			          { 
				          spill.
				          (LambcalcAllocaInsn ty: LambcalcI64Ty new) } ]).
	entryBlock := (entry lowerWith: spills) at: 2.
	entryBlock insns do: [ :i | insns add: i ].
	entryBlock insns: insns.
	labeledBlocks := joins collect: [ :join | join lowerWith: spills ].
	^ { 
		  binding.
		  (LambcalcFdecl
			   fty: LambcalcLower fty
			   params: params
			   cfg: (LambcalcCfg entry: entryBlock labeledBlocks: labeledBlocks)) }
]

{ #category : #accessing }
LambcalcFunc >> params [

	^ params
]

{ #category : #printing }
LambcalcFunc >> printArray: array on: aStream [

	aStream nextPutAll: '{'.
	array do: [ :v | 
		aStream nextPutAll: ' '.
		v printOn: aStream.
		aStream nextPutAll: '.' ].
	aStream nextPutAll: ' }'
]

{ #category : #printing }
LambcalcFunc >> printOn: aStream [

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
LambcalcFunc >> printOrderedCollection: aCollection on: aStream [

	aStream nextPutAll: '(OrderedCollection withAll: '.
	self printArray: aCollection asArray on: aStream.
	aStream nextPutAll: ')'
]
