Class {
	#name : #StructTy,
	#superclass : #Ty,
	#instVars : [
		'tys'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #printing }
StructTy >> printOn: aStream [

	aStream nextPutAll: '{ '.
	tys
		do: [ :ty | ty printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ' }'	
]
