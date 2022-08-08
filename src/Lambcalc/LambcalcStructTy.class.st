Class {
	#name : #LambcalcStructTy,
	#superclass : #LambcalcTy,
	#instVars : [
		'tys'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
LambcalcStructTy >> printOn: aStream [

	aStream nextPutAll: '{ '.
	tys
		do: [ :ty | ty printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ' }'	
]
