Class {
	#name : #LcBlock,
	#superclass : #Object,
	#instVars : [
		'insns',
		'terminator'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcBlock class >> insns: aCollection terminator: aTerminator [

	^ self new initializeInsns: aCollection terminator: aTerminator
]

{ #category : #'as yet unclassified' }
LcBlock >> initializeInsns: aCollection terminator: aTerminator [

	insns := aCollection.
	terminator := aTerminator
]

{ #category : #accessing }
LcBlock >> insns [
	^ insns
]

{ #category : #accessing }
LcBlock >> insns: aCollection [ 
	insns := aCollection
]

{ #category : #printing }
LcBlock >> printOn: aStream [

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
