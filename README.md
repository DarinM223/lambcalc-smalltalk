Lambcalc-Smalltalk
==================

Implementation of Lambcalc in Pharo Smalltalk, in order to compare with the Haskell version.

To install, run this in a playground:

```smalltalk
Metacello new
	baseline: 'Lambcalc';
	repository: 'github://DarinM223/lambcalc-smalltalk:master/src';
	load.
```

Usage
-----

Showing the compilation output in the Transcript:
```smalltalk
LcCompiler compile: '(fn x => (fn y => x + y)) 2 3' on: Transcript.
Transcript flush
```

Creating a string of the compilation output:
```smalltalk
String streamContents: [ :out |
	LcCompiler
		compile: '(fn x => (fn y => x + y)) 2 3'
		on: out ]
```

Creating a LLVM file that can be compiled to an executable with `llc`:
```smalltalk
" Creates a file called 'addition.ll' in your Smalltalk image directory. "
LcCompiler compile: '(fn x => (fn y => x + y)) 2 3' toFilename: 'addition.ll'
```