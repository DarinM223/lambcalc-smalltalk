Class {
	#name : #FunTy,
	#superclass : #Ty,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
FunTy class >> ty: aCollection [

	^ self new ty: aCollection
]

{ #category : #accessing }
FunTy >> ty: aCollection [ 
	ty := aCollection
]
