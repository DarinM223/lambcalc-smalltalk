Class {
	#name : #LcLamNode,
	#superclass : #Object,
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LcLamNode >> alphaRename [

	self alphaRenameWith: Dictionary new
]

{ #category : #'alpha renaming' }
LcLamNode >> alphaRenameWith: aDictionary [

	| child |
	self class slots do: [ :slot | 
		child := slot read: self.
		(child isKindOf: LcLamNode) ifTrue: [ 
			child alphaRenameWith: aDictionary ] ]
]

{ #category : #'anf conversion' }
LcLamNode >> anfConvert [

	^ self anfConvertWith: [ :value | LcHaltAnfExp val: value ]
]

{ #category : #printing }
LcLamNode >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self className;
		nextPutAll: ' new'.
	self class slots
		do: [ :slot | 
			aStream
				nextPutAll: ' ';
				nextPutAll: slot name;
				nextPutAll: ': '.
			(slot read: self) printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ';' ].
	aStream nextPutAll: ')'
]
