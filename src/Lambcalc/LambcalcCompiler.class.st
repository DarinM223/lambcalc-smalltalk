Class {
	#name : #LambcalcCompiler,
	#superclass : #Object,
	#category : #Lambcalc
}

{ #category : #compiling }
LambcalcCompiler class >> compile: aString on: aStream [

	| parser node fns fdecls prog |
	Temp reset.
	parser := Parser new.
	node := parser parse: aString.
	node alphaRename.
	fns := node anfConvert closureConvert hoist.
	fdecls := fns collect: [ :fn | fn lower ].
	prog := Prog new
		        fdecls: fdecls;
		        edecls: { { 
				        'malloc'.
				        (FunTy ty: { 
							         { I64Ty new }.
							         (PtrTy ty: I64Ty new) }) } }.
	prog printOn: aStream
]

{ #category : #compiling }
LambcalcCompiler class >> compile: aString toFilename: aString2 [

	| dir |
	dir := FileSystem disk workingDirectory.
	dir / aString2 writeStreamDo: [ :out | self compile: aString on: out ]
]
