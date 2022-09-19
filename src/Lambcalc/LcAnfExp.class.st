Class {
	#name : #LcAnfExp,
	#superclass : #Object,
	#category : #'Lambcalc-Anf'
}

{ #category : #'closure conversion' }
LcAnfExp >> closureConvert [

	| child newExp |
	newExp := self class new.
	self class slots do: [ :slot | 
		child := slot read: self.

		slot
			write: ((child isKindOf: LcAnfExp)
					 ifTrue: [ child closureConvert ]
					 ifFalse: [ child ])
			to: newExp ].
	^ newExp
]

{ #category : #'free variables' }
LcAnfExp >> freeVars [

	^ self freeVarsWith: Set empty
]

{ #category : #hoisting }
LcAnfExp >> hoist [

	| fns joins |
	fns := OrderedCollection new.
	joins := OrderedCollection new.
	(LcFunAnfExp
		 binding: 'main'
		 params: {  }
		 body: self
		 rest: (LcHaltAnfExp val: (LcIntAnfValue val: 0)))
		hoistWithFunctions: fns
		andJoins: joins.
	^ fns
]

{ #category : #hoisting }
LcAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| child newExp |
	newExp := self class new.
	self class slots do: [ :slot | 
		child := slot read: self.

		slot
			write: ((child isKindOf: LcAnfExp)
					 ifTrue: [ child hoistWithFunctions: functions andJoins: joins ]
					 ifFalse: [ child ])
			to: newExp ].
	^ newExp
]

{ #category : #printing }
LcAnfExp >> printOn: aStream [

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
		slotValue isArray
			ifTrue: [ 
				aStream nextPutAll: '{'.
				slotValue do: [ :v | 
					aStream nextPutAll: ' '.
					v printOn: aStream.
					aStream nextPutAll: '.' ].
				aStream nextPutAll: ' }' ]
			ifFalse: [ slotValue printOn: aStream ] ].
	aStream nextPutAll: ')'
]
