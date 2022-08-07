Class {
	#name : #Fdecl,
	#superclass : #Object,
	#instVars : [
		'fty',
		'params',
		'cfg'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #'as yet unclassified' }
Fdecl class >> fty: aCollection params: aCollection2 cfg: aCfg [

	^ self new fty: aCollection params: aCollection2 cfg: aCfg
]

{ #category : #'as yet unclassified' }
Fdecl >> fty: aCollection params: aCollection2 cfg: aCfg [

	fty := aCollection.
	params := aCollection2.
	cfg := aCfg
]

{ #category : #printing }
Fdecl >> printWithGid: aString on: aStream [

	| paramTypes paramsString |
	paramTypes := fty at: 1.
	paramsString := ((1 to: (paramTypes size min: params size)) collect: [ 
		                 :i | 
		                 '{1} %{2}' format: { 
				                 (paramTypes at: i).
				                 (params at: i) } ]) joinUsing: ', '.
	aStream
		nextPutAll: ('define {1} @{2}({3}) \{' format: { 
						 (fty at: 2).
						 aString.
						 paramsString });
		cr.
	cfg printOn: aStream.
	aStream
		cr;
		nextPutAll: '}';
		cr
]
