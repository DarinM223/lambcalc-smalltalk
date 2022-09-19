Class {
	#name : #LcFunTy,
	#superclass : #LcTy,
	#instVars : [
		'ty'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcFunTy class >> ty: aCollection [

	^ self new ty: aCollection
]

{ #category : #printing }
LcFunTy >> printOn: aStream [

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
LcFunTy >> printWithGid: aString on: aStream [

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
LcFunTy >> ty: aCollection [ 
	ty := aCollection
]
