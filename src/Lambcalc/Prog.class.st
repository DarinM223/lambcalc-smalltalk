Class {
	#name : #Prog,
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
Prog >> edecls: aCollection [ 
	edecls := aCollection
]

{ #category : #accessing }
Prog >> fdecls: aCollection [ 
	fdecls := aCollection
]

{ #category : #printing }
Prog >> printOn: aStream [

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
