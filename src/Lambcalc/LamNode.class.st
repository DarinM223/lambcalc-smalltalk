Class {
	#name : #LamNode,
	#superclass : #Object,
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LamNode >> alphaRename [

	self alphaRenameWith: Dictionary new
]

{ #category : #'alpha renaming' }
LamNode >> alphaRenameWith: aDictionary [

	| child |
	self class slots do: [ :slot | 
		child := slot read: self.
		(child isKindOf: LamNode) ifTrue: [ 
			child alphaRenameWith: aDictionary ] ]
]

{ #category : #'anf conversion' }
LamNode >> anfConvert [

	^ self anfConvertWith: [ :value | HaltAnfExp val: value ]
]

{ #category : #printing }
LamNode >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self className;
		nextPutAll: ' new'.
	self class slots do: [ :slot | 
		aStream
			nextPutAll: ' ';
			nextPutAll: slot name;
			nextPutAll: ': '.
		(slot read: self) printOn: aStream.
		aStream nextPutAll: ';' ].
	aStream nextPutAll: ' yourself)'
]
