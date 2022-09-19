Class {
	#name : #LcProg,
	#superclass : #Object,
	#instVars : [
		'tdecls',
		'gdecls',
		'fdecls',
		'edecls'
	],
	#category : #'Lambcalc-Llvm'
}

{ #category : #accessing }
LcProg >> edecls: aCollection [ 
	edecls := aCollection
]

{ #category : #accessing }
LcProg >> fdecls: aCollection [ 
	fdecls := aCollection
]

{ #category : #printing }
LcProg >> printOn: aStream [

	fdecls
		do: [ :fdecl | fdecl printFdeclOn: aStream ]
		separatedBy: [ aStream cr ].

	aStream
		cr;
		cr.
	edecls
		do: [ :edecl | 
		(edecl at: 2) printWithGid: (edecl at: 1) on: aStream ]
		separatedBy: [ aStream cr ]
]
