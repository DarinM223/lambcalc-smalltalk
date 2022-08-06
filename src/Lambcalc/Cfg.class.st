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

	^ self new entry: aBlock labeledBlocks: aCollection
]

{ #category : #'as yet unclassified' }
Cfg >> entry: aBlock labeledBlocks: aCollection [

	entry := aBlock.
	labeledBlocks := aCollection
]
