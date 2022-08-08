Class {
	#name : #LambcalcAnfExp,
	#superclass : #Object,
	#category : #'Lambcalc-Anf'
}

{ #category : #'closure conversion' }
LambcalcAnfExp >> closureConvert [

	| child newExp |
	newExp := self class new.
	self class slots do: [ :slot | 
		child := slot read: self.

		slot
			write: ((child isKindOf: LambcalcAnfExp)
					 ifTrue: [ child closureConvert ]
					 ifFalse: [ child ])
			to: newExp ].
	^ newExp
]

{ #category : #'free variables' }
LambcalcAnfExp >> freeVars [

	^ self freeVarsWith: Set empty
]

{ #category : #hoisting }
LambcalcAnfExp >> hoist [

	| fns joins |
	fns := OrderedCollection new.
	joins := OrderedCollection new.
	(LambcalcFunAnfExp
		 binding: 'main'
		 params: {  }
		 body: self
		 rest: (LambcalcHaltAnfExp val: (LambcalcIntAnfValue val: 0)))
		hoistWithFunctions: fns
		andJoins: joins.
	^ fns
]

{ #category : #hoisting }
LambcalcAnfExp >> hoistWithFunctions: functions andJoins: joins [

	| child newExp |
	newExp := self class new.
	self class slots do: [ :slot | 
		child := slot read: self.

		slot
			write: ((child isKindOf: LambcalcAnfExp)
					 ifTrue: [ child hoistWithFunctions: functions andJoins: joins ]
					 ifFalse: [ child ])
			to: newExp ].
	^ newExp
]

{ #category : #printing }
LambcalcAnfExp >> printOn: aStream [

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
