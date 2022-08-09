Class {
	#name : #LambcalcLamNode,
	#superclass : #Object,
	#category : #'Lambcalc-Lambda'
}

{ #category : #'alpha renaming' }
LambcalcLamNode >> alphaRename [

	self alphaRenameWith: Dictionary new
]

{ #category : #'alpha renaming' }
LambcalcLamNode >> alphaRenameWith: aDictionary [

	| child |
	self class slots do: [ :slot | 
		child := slot read: self.
		(child isKindOf: LambcalcLamNode) ifTrue: [ 
			child alphaRenameWith: aDictionary ] ]
]

{ #category : #'anf conversion' }
LambcalcLamNode >> anfConvert [

	^ self anfConvertWith: [ :value | LambcalcHaltAnfExp val: value ]
]

{ #category : #printing }
LambcalcLamNode >> printOn: aStream [

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
