Class {
	#name : #Block,
	#superclass : #Object,
	#instVars : [
		'insns',
		'terminator'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
Block class >> insns: aCollection terminator: aTerminator [

	^ self new insns: aCollection terminator: aTerminator
]

{ #category : #accessing }
Block >> insns [
	^ insns
]

{ #category : #accessing }
Block >> insns: aCollection [ 
	insns := aCollection
]

{ #category : #'as yet unclassified' }
Block >> insns: aCollection terminator: aTerminator [

	insns := aCollection.
	terminator := aTerminator
]

{ #category : #printing }
Block >> printOn: aStream [

	insns
		do: [ :i | 
			aStream nextPutAll: '  '.
			(i at: 2) printWithUid: (i at: 1) on: aStream ]
		separatedBy: [ aStream cr ].
	aStream
		cr;
		nextPutAll: '  '.
	terminator printOn: aStream
]
