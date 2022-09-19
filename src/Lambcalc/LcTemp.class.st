"
I generate fresh temporaries.
"
Class {
	#name : #LcTemp,
	#superclass : #Object,
	#classVars : [
		'Counter'
	],
	#category : #'Lambcalc-Temp'
}

{ #category : #temp }
LcTemp class >> fresh [

	Counter := Counter + 1.
	^ Counter
]

{ #category : #'class initialization' }
LcTemp class >> initialize [

	Counter := -1
]

{ #category : #'class initialization' }
LcTemp class >> reset [

	Counter := -1
]
