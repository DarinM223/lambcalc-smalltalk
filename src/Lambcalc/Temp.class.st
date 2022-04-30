"
I generate fresh temporaries.
"
Class {
	#name : #Temp,
	#superclass : #Object,
	#classVars : [
		'Counter'
	],
	#category : #'Lambcalc-Temp'
}

{ #category : #temp }
Temp class >> fresh [

	Counter := Counter + 1.
	^ Counter
]

{ #category : #'class initialization' }
Temp class >> initialize [

	Counter := -1
]

{ #category : #'class initialization' }
Temp class >> reset [

	Counter := -1
]
