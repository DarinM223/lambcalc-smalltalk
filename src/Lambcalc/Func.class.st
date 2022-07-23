Class {
	#name : #Func,
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
Func class >> binding: aString params: anArray entry: aJoin joins: aCollection [

	^ self new
		  initializeBinding: aString
		  params: anArray
		  entry: aJoin
		  joins: aCollection
]

{ #category : #accessing }
Func >> binding [

	^ binding
]

{ #category : #accessing }
Func >> entry [

	^ entry
]

{ #category : #initialization }
Func >> initializeBinding: aString params: anArray entry: aJoin joins: aCollection [

	binding := aString.
	params := anArray.
	entry := aJoin.
	joins := aCollection
]

{ #category : #accessing }
Func >> joins [

	^ joins
]

{ #category : #accessing }
Func >> params [

	^ params
]

{ #category : #printing }
Func >> printArray: array on: aStream [

	aStream nextPutAll: '{'.
	array do: [ :v | 
		aStream nextPutAll: ' '.
		v printOn: aStream.
		aStream nextPutAll: '.' ].
	aStream nextPutAll: ' }'
]

{ #category : #printing }
Func >> printOn: aStream [

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
Func >> printOrderedCollection: aCollection on: aStream [

	aStream nextPutAll: '(OrderedCollection withAll: '.
	self printArray: aCollection asArray on: aStream.
	aStream nextPutAll: ')'
]
