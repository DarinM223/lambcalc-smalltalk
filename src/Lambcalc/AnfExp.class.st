Class {
	#name : #AnfExp,
	#superclass : #Object,
	#category : #'Lambcalc-Anf'
}

{ #category : #'closure conversion' }
AnfExp >> closureConvert [

	| child newExp |
	newExp := self class new.
	self class slots do: [ :slot | 
		child := slot read: self.

		slot
			write: ((child isKindOf: AnfExp)
					 ifTrue: [ child closureConvert ]
					 ifFalse: [ child ])
			to: newExp ].
	^ newExp
]

{ #category : #'free variables' }
AnfExp >> freeVars [

	^ self freeVarsWith: Set empty
]

{ #category : #printing }
AnfExp >> printOn: aStream [

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
