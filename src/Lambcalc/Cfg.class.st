Class {
	#name : #Cfg,
	#superclass : #Object,
	#instVars : [
		'entry',
		'labeledBlocks'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
Cfg class >> entry: aBlock labeledBlocks: aCollection [

	^ self new initializeEntry: aBlock labeledBlocks: aCollection
]

{ #category : #'as yet unclassified' }
Cfg >> initializeEntry: aBlock labeledBlocks: aCollection [

	entry := aBlock.
	labeledBlocks := aCollection
]

{ #category : #printing }
Cfg >> printOn: aStream [

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
