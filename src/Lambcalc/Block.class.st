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
