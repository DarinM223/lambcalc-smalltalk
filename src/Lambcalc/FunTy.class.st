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

{ #category : #printing }
FunTy >> printOn: aStream [

	| argTys retTy |
	argTys := ty at: 1.
	retTy := ty at: 2.

	retTy printOn: aStream.
	aStream nextPutAll: ' ('.
	argTys
		do: [ :t | t printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ')'
]

{ #category : #accessing }
FunTy >> ty: aCollection [ 
	ty := aCollection
]
