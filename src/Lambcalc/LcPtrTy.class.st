Class {
	#name : #LcPtrTy,
	#superclass : #LcTy,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LcPtrTy class >> ty: aTy [

	^ self new ty: aTy
]

{ #category : #printing }
LcPtrTy >> printOn: aStream [

	ty printOn: aStream.
	aStream nextPutAll: '*'
]

{ #category : #accessing }
LcPtrTy >> ty [
	^ ty
]

{ #category : #accessing }
LcPtrTy >> ty: aTy [

	ty := aTy
]
