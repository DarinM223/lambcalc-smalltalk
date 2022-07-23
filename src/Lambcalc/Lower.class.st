Class {
	#name : #Lower,
	#superclass : #Object,
	#instVars : [
		'last'
	],
	#category : #'Lambcalc-Lower'
}

{ #category : #accessing }
Lower >> last [

	^ last
]

{ #category : #accessing }
Lower >> last: anObject [

	last := anObject
]

{ #category : #'llvm lowering' }
Lower >> lowerFunc: fn [

	^ self notYetImplemented
]
