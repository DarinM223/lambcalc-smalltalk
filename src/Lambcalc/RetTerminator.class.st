Class {
	#name : #RetTerminator,
	#superclass : #Terminator,
	#instVars : [
		'ty',
		'val'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
RetTerminator class >> ty: aTy val: anOperand [

	^ self new initializeTy: aTy val: anOperand
]

{ #category : #'as yet unclassified' }
RetTerminator >> initializeTy: aTy val: anOperand [

	ty := aTy.
	val := anOperand
]

{ #category : #printing }
RetTerminator >> printOn: aStream [

	val ifNil: [ aStream nextPutAll: 'ret void' ] ifNotNil: [ 
		aStream nextPutAll: 'ret '.
		ty printOn: aStream.
		aStream nextPutAll: ' '.
		val printOn: aStream ]
]
