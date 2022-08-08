Class {
	#name : #LambcalcCompiler,
	#superclass : #Object,
	#category : #Lambcalc
}

{ #category : #compiling }
LambcalcCompiler class >> compile: aString on: aStream [

	| parser node fns fdecls prog |
	LambcalcTemp reset.
	parser := LambcalcParser new.
	node := parser parse: aString.
	node alphaRename.
	fns := node anfConvert closureConvert hoist.
	fdecls := fns collect: [ :fn | fn lower ].
	prog := LambcalcProg new
		        fdecls: fdecls;
		        edecls: { { 
				        'malloc'.
				        (LambcalcFunTy ty: { 
							         { LambcalcI64Ty new }.
							         (LambcalcPtrTy ty: LambcalcI64Ty new) }) } }.
	prog printOn: aStream
]

{ #category : #compiling }
LambcalcCompiler class >> compile: aString toFilename: aString2 [

	| dir |
	dir := FileSystem disk workingDirectory.
	dir / aString2 writeStreamDo: [ :out | self compile: aString on: out ]
]
