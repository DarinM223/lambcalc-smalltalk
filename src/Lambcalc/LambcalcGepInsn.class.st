Class {
	#name : #LambcalcGepInsn,
	#superclass : #LambcalcInsn,
	#instVars : [
		'ty',
		'ptr',
		'indexes'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcGepInsn class >> ty: aTy ptr: anOperand indexes: aCollection [

	^ self new initializeTy: aTy ptr: anOperand indexes: aCollection
]

{ #category : #initialization }
LambcalcGepInsn >> initializeTy: aTy ptr: anOperand indexes: aCollection [

	ty := aTy.
	ptr := anOperand.
	indexes := aCollection
]

{ #category : #printing }
LambcalcGepInsn >> printOn: aStream [

	aStream nextPutAll: 'getelementptr '.
	ty ty printOn: aStream.
	aStream nextPutAll: ', '.
	ty printOn: aStream.
	aStream nextPutAll: ' '.
	ptr printOn: aStream.
	aStream nextPutAll: ', '.
	indexes
		do: [ :i | i printGepIndexOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]
