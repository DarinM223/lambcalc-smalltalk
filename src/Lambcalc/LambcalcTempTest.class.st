Class {
	#name : #LambcalcTempTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Temp'
}

{ #category : #tests }
LambcalcTempTest >> testTemp [

	LambcalcTemp reset.
	self assert: LambcalcTemp fresh equals: 0.
	self assert: LambcalcTemp fresh equals: 1.
	self assert: LambcalcTemp fresh equals: 2.
	LambcalcTemp reset.
	self assert: LambcalcTemp fresh equals: 0.
	LambcalcTemp reset
]
