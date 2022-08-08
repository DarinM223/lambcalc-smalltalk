Class {
	#name : #LambcalcLower,
	#superclass : #Object,
	#instVars : [
		'last',
		'spills',
		'instrs'
	],
	#category : #'Lambcalc-Lower'
}

{ #category : #'as yet unclassified' }
LambcalcLower class >> fty [

	^ { 
		  { 
			  LambcalcI64Ty new.
			  LambcalcI64Ty new }.
		  LambcalcI64Ty new }
]

{ #category : #'as yet unclassified' }
LambcalcLower class >> spills: aCollection instrs: aCollection2 [

	^ self new initializeSpills: aCollection instrs: aCollection2
]

{ #category : #initialization }
LambcalcLower >> initializeSpills: aCollection instrs: aCollection2 [

	spills := aCollection.
	instrs := aCollection2
]

{ #category : #accessing }
LambcalcLower >> instrs [

	^ instrs
]

{ #category : #accessing }
LambcalcLower >> last [

	^ last
]

{ #category : #accessing }
LambcalcLower >> last: anObject [

	last := anObject
]

{ #category : #accessing }
LambcalcLower >> spills [
	^ spills
]

{ #category : #'as yet unclassified' }
LambcalcLower >> spills: aCollection [

	spills := aCollection
]
