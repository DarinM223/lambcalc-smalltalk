Class {
	#name : #LcStructTy,
	#superclass : #LcTy,
	#instVars : [
		'tys'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LcStructTy >> printOn: aStream [

	aStream nextPutAll: '{ '.
	tys
		do: [ :ty | ty printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ' }'	
]
