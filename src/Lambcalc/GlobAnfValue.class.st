Class {
	#name : #GlobAnfValue,
	#superclass : #AnfValue,
	#instVars : [
		'var'
	],
	#category : #'Lambcalc-Anf'
}

{ #category : #accessing }
GlobAnfValue class >> var: aString [

	^ self new var: aString
]

{ #category : #accessing }
GlobAnfValue >> var: aString [

	var := aString
]
