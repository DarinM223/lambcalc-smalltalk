Class {
	#name : #GepInsn,
	#superclass : #Insn,
	#instVars : [
		'ty',
		'ptr',
		'indexes'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
GepInsn class >> ty: aTy ptr: anOperand indexes: aCollection [

	^ self new initializeTy: aTy ptr: anOperand indexes: aCollection
]

{ #category : #initialization }
GepInsn >> initializeTy: aTy ptr: anOperand indexes: aCollection [

	ty := aTy.
	ptr := anOperand.
	indexes := aCollection
]

{ #category : #printing }
GepInsn >> printOn: aStream [

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
