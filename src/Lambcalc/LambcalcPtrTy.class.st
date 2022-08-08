Class {
	#name : #LambcalcPtrTy,
	#superclass : #LambcalcTy,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcPtrTy class >> ty: aTy [

	^ self new ty: aTy
]

{ #category : #printing }
LambcalcPtrTy >> printOn: aStream [

	ty printOn: aStream.
	aStream nextPutAll: '*'
]

{ #category : #accessing }
LambcalcPtrTy >> ty [
	^ ty
]

{ #category : #accessing }
LambcalcPtrTy >> ty: aTy [

	ty := aTy
]
