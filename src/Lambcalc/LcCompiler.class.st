Class {
	#name : #LcCompiler,
	#superclass : #Object,
	#category : #Lambcalc
}

{ #category : #compiling }
LcCompiler class >> compile: aString on: aStream [

	| parser node fns fdecls prog |
	LcTemp reset.
	parser := LcParser new.
	node := parser parse: aString.
	node alphaRename.
	fns := node anfConvert closureConvert hoist.
	fdecls := fns collect: [ :fn | fn lower ].
	prog := LcProg new
		        fdecls: fdecls;
		        edecls: { { 
				        'malloc'.
				        (LcFunTy ty: { 
							         { LcI64Ty new }.
							         (LcPtrTy ty: LcI64Ty new) }) } }.
	prog printOn: aStream
]

{ #category : #compiling }
LcCompiler class >> compile: aString toFilename: aString2 [

	| dir |
	dir := FileSystem disk workingDirectory.
	dir / aString2 writeStreamDo: [ :out | self compile: aString on: out ]
]
