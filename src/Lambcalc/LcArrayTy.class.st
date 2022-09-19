Class {
	#name : #LcArrayTy,
	#superclass : #LcTy,
	#instVars : [
		'size',
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcArrayTy >> printOn: aStream [

	aStream nextPutAll: ('[{1} x {2}]' format: { 
				 size.
				 ty })
]
