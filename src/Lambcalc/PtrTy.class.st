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

{ #category : #printing }
PtrTy >> printOn: aStream [

	ty printOn: aStream.
	aStream nextPutAll: '*'
]

{ #category : #accessing }
PtrTy >> ty [
	^ ty
]

{ #category : #accessing }
PtrTy >> ty: aTy [

	ty := aTy
]
