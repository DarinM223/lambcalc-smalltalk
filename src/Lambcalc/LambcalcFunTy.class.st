Class {
	#name : #LambcalcFunTy,
	#superclass : #LambcalcTy,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LambcalcFunTy class >> ty: aCollection [

	^ self new ty: aCollection
]

{ #category : #printing }
LambcalcFunTy >> printOn: aStream [

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

{ #category : #printing }
LambcalcFunTy >> printWithGid: aString on: aStream [

	| argTys retTy |
	argTys := ty at: 1.
	retTy := ty at: 2.

	aStream nextPutAll: 'declare '.
	retTy printOn: aStream.
	aStream
		nextPutAll: ' @';
		nextPutAll: aString;
		nextPutAll: '('.
	argTys
		do: [ :t | t printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ')'
]

{ #category : #accessing }
LambcalcFunTy >> ty: aCollection [ 
	ty := aCollection
]
