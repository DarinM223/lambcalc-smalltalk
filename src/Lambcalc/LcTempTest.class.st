Class {
	#name : #LcTempTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Temp'
}

{ #category : #tests }
LcTempTest >> testTemp [

	LcTemp reset.
	self assert: LcTemp fresh equals: 0.
	self assert: LcTemp fresh equals: 1.
	self assert: LcTemp fresh equals: 2.
	LcTemp reset.
	self assert: LcTemp fresh equals: 0.
	LcTemp reset
]
