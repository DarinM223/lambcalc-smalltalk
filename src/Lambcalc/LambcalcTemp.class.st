"
I generate fresh temporaries.
"
Class {
	#name : #LambcalcTemp,
	#superclass : #Object,
	#classVars : [
		'Counter'
	],
	#category : #'Lambcalc-Temp'
}

{ #category : #temp }
LambcalcTemp class >> fresh [

	Counter := Counter + 1.
	^ Counter
]

{ #category : #'class initialization' }
LambcalcTemp class >> initialize [

	Counter := -1
]

{ #category : #'class initialization' }
LambcalcTemp class >> reset [

	Counter := -1
]
