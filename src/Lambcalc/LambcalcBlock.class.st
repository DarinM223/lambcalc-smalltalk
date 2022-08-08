Class {
	#name : #LambcalcBlock,
	#superclass : #Object,
	#instVars : [
		'insns',
		'terminator'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcBlock class >> insns: aCollection terminator: aTerminator [

	^ self new initializeInsns: aCollection terminator: aTerminator
]

{ #category : #'as yet unclassified' }
LambcalcBlock >> initializeInsns: aCollection terminator: aTerminator [

	insns := aCollection.
	terminator := aTerminator
]

{ #category : #accessing }
LambcalcBlock >> insns [
	^ insns
]

{ #category : #accessing }
LambcalcBlock >> insns: aCollection [ 
	insns := aCollection
]

{ #category : #printing }
LambcalcBlock >> printOn: aStream [

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
