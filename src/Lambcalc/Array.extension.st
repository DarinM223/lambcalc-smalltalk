Extension { #name : #Array }

{ #category : #'*Lambcalc' }
Array >> printFdeclOn: aStream [

	| gid fdecl |
	gid := self at: 1.
	fdecl := self at: 2.
	fdecl printWithGid: gid on: aStream
]

{ #category : #'*Lambcalc' }
Array >> printFdeclString [

	^ String streamContents: [ :str | self printFdeclOn: str ]
]
