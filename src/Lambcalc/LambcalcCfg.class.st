Class {
	#name : #LambcalcCfg,
	#superclass : #Object,
	#instVars : [
		'entry',
		'labeledBlocks'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcCfg class >> entry: aBlock labeledBlocks: aCollection [

	^ self new initializeEntry: aBlock labeledBlocks: aCollection
]

{ #category : #'as yet unclassified' }
LambcalcCfg >> initializeEntry: aBlock labeledBlocks: aCollection [

	entry := aBlock.
	labeledBlocks := aCollection
]

{ #category : #printing }
LambcalcCfg >> printOn: aStream [

	entry printOn: aStream.
	aStream cr.
	labeledBlocks
		do: [ :tuple | 
			aStream
				nextPutAll: (tuple at: 1);
				nextPutAll: ':';
				cr.
			(tuple at: 2) printOn: aStream ]
		separatedBy: [ aStream cr ]
]
