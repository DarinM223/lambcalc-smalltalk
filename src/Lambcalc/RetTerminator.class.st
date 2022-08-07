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

	^ self new ty: aTy val: anOperand
]

{ #category : #printing }
RetTerminator >> printOn: aStream [

	val ifNil: [ aStream nextPutAll: 'ret void' ] ifNotNil: [ 
		aStream nextPutAll: 'ret '.
		ty printOn: aStream.
		aStream nextPutAll: ' '.
		val printOn: aStream ]
]

{ #category : #'as yet unclassified' }
RetTerminator >> ty: aTy val: anOperand [

	ty := aTy.
	val := anOperand
]
