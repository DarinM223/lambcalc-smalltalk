Class {
	#name : #LcLower,
	#superclass : #Object,
	#instVars : [
		'last',
		'spills',
		'instrs'
	],
	#category : #'Lambcalc-Lower'
}

{ #category : #'as yet unclassified' }
LcLower class >> fty [

	^ { 
		  { 
			  LcI64Ty new.
			  LcI64Ty new }.
		  LcI64Ty new }
]

{ #category : #'as yet unclassified' }
LcLower class >> spills: aCollection instrs: aCollection2 [

	^ self new initializeSpills: aCollection instrs: aCollection2
]

{ #category : #initialization }
LcLower >> initializeSpills: aCollection instrs: aCollection2 [

	spills := aCollection.
	instrs := aCollection2
]

{ #category : #accessing }
LcLower >> instrs [

	^ instrs
]

{ #category : #accessing }
LcLower >> last [

	^ last
]

{ #category : #accessing }
LcLower >> last: anObject [

	last := anObject
]

{ #category : #accessing }
LcLower >> spills [
	^ spills
]

{ #category : #'as yet unclassified' }
LcLower >> spills: aCollection [

	spills := aCollection
]
