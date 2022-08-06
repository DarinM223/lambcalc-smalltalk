Class {
	#name : #Lower,
	#superclass : #Object,
	#instVars : [
		'last',
		'spills',
		'instrs'
	],
	#category : #'Lambcalc-Lower'
}

{ #category : #'as yet unclassified' }
Lower class >> fty [

	^ { 
		  { 
			  I64Ty new.
			  I64Ty new }.
		  I64Ty new }
]

{ #category : #'as yet unclassified' }
Lower class >> spills: aCollection instrs: aCollection2 [

	^ self new initializeSpills: aCollection instrs: aCollection2
]

{ #category : #initialization }
Lower >> initializeSpills: aCollection instrs: aCollection2 [

	spills := aCollection.
	instrs := aCollection2
]

{ #category : #accessing }
Lower >> instrs [

	^ instrs
]

{ #category : #accessing }
Lower >> last [

	^ last
]

{ #category : #accessing }
Lower >> last: anObject [

	last := anObject
]

{ #category : #accessing }
Lower >> spills [
	^ spills
]

{ #category : #'as yet unclassified' }
Lower >> spills: aCollection [

	spills := aCollection
]
