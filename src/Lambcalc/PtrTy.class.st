Class {
	#name : #PtrTy,
	#superclass : #Ty,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
PtrTy class >> ty: aTy [

	^ self new ty: aTy
]

{ #category : #accessing }
PtrTy >> ty: aTy [

	ty := aTy
]
