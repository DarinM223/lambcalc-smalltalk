Class {
	#name : #LambcalcArrayTy,
	#superclass : #LambcalcTy,
	#instVars : [
		'size',
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcArrayTy >> printOn: aStream [

	aStream nextPutAll: ('[{1} x {2}]' format: { 
				 size.
				 ty })
]
