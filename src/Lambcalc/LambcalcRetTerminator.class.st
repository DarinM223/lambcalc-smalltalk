Class {
	#name : #LambcalcRetTerminator,
	#superclass : #LambcalcTerminator,
	#instVars : [
		'ty',
		'val'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
LambcalcRetTerminator class >> ty: aTy val: anOperand [

	^ self new initializeTy: aTy val: anOperand
]

{ #category : #'as yet unclassified' }
LambcalcRetTerminator >> initializeTy: aTy val: anOperand [

	ty := aTy.
	val := anOperand
]

{ #category : #printing }
LambcalcRetTerminator >> printOn: aStream [

	val ifNil: [ aStream nextPutAll: 'ret void' ] ifNotNil: [ 
		aStream nextPutAll: 'ret '.
		ty printOn: aStream.
		aStream nextPutAll: ' '.
		val printOn: aStream ]
]
