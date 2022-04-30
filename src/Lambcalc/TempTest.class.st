Class {
	#name : #TempTest,
	#superclass : #TestCase,
	#category : #'Lambcalc-Temp'
}

{ #category : #tests }
TempTest >> testTemp [

	Temp reset.
	self assert: Temp fresh equals: 0.
	self assert: Temp fresh equals: 1.
	self assert: Temp fresh equals: 2.
	Temp reset.
	self assert: Temp fresh equals: 0.
	Temp reset
]
