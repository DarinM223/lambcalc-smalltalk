Class {
	#name : #ArrayTy,
	#superclass : #Ty,
	#instVars : [
		'size',
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
ArrayTy >> printOn: aStream [

	aStream nextPutAll: ('[{1} x {2}]' format: { 
				 size.
				 ty })
]
