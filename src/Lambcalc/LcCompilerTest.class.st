Class {
	#name : #LcCompilerTest,
	#superclass : #TestCase,
	#category : #Lambcalc
}

{ #category : #tests }
LcCompilerTest >> testFactorial5 [

	| program result |
	program := '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	result := String streamContents: [ :str | 
		          LcCompiler compile: program on: str ].
	self assert: result equals: 'define i64 @f9(i64 %env33, i64 %v2) {
  %t61 = inttoptr i64 %env33 to i64*
  %a60 = getelementptr i64, i64* %t61, i32 1
  %x1 = load i64, i64* %a60
  %t63 = inttoptr i64 %x1 to i64*
  %a62 = getelementptr i64, i64* %t63, i32 0
  %x134 = load i64, i64* %a62
  %c64 = inttoptr i64 %x134 to i64 (i64, i64)*
  %r10 = call i64 %c64(i64 %x1, i64 %x1)
  %t66 = inttoptr i64 %r10 to i64*
  %a65 = getelementptr i64, i64* %t66, i32 0
  %r1035 = load i64, i64* %a65
  %c67 = inttoptr i64 %r1035 to i64 (i64, i64)*
  %r11 = call i64 %c67(i64 %r10, i64 %v2)
  ret i64 %r11

}

define i64 @f14(i64 %env38, i64 %v4) {
  %t69 = inttoptr i64 %env38 to i64*
  %a68 = getelementptr i64, i64* %t69, i32 1
  %x3 = load i64, i64* %a68
  %t71 = inttoptr i64 %x3 to i64*
  %a70 = getelementptr i64, i64* %t71, i32 0
  %x339 = load i64, i64* %a70
  %c72 = inttoptr i64 %x339 to i64 (i64, i64)*
  %r15 = call i64 %c72(i64 %x3, i64 %x3)
  %t74 = inttoptr i64 %r15 to i64*
  %a73 = getelementptr i64, i64* %t74, i32 0
  %r1540 = load i64, i64* %a73
  %c75 = inttoptr i64 %r1540 to i64 (i64, i64)*
  %r16 = call i64 %c75(i64 %r15, i64 %v4)
  ret i64 %r16

}

define i64 @f13(i64 %env37, i64 %x3) {
  %t77 = inttoptr i64 %env37 to i64*
  %a76 = getelementptr i64, i64* %t77, i32 1
  %g0 = load i64, i64* %a76
  %ptr78 = call i64* @malloc(i64 16)
  %f14 = ptrtoint i64* %ptr78 to i64
  %off79 = getelementptr i64, i64* %ptr78, i32 0
  %casted80 = ptrtoint i64 (i64, i64)* @f14 to i64
  store i64 %casted80, i64* %off79
  %off81 = getelementptr i64, i64* %ptr78, i32 1
  store i64 %x3, i64* %off81
  %t83 = inttoptr i64 %g0 to i64*
  %a82 = getelementptr i64, i64* %t83, i32 0
  %g041 = load i64, i64* %a82
  %c84 = inttoptr i64 %g041 to i64 (i64, i64)*
  %r17 = call i64 %c84(i64 %g0, i64 %f14)
  ret i64 %r17

}

define i64 @f8(i64 %env32, i64 %x1) {
  %t86 = inttoptr i64 %env32 to i64*
  %a85 = getelementptr i64, i64* %t86, i32 1
  %g0 = load i64, i64* %a85
  %ptr87 = call i64* @malloc(i64 16)
  %f9 = ptrtoint i64* %ptr87 to i64
  %off88 = getelementptr i64, i64* %ptr87, i32 0
  %casted89 = ptrtoint i64 (i64, i64)* @f9 to i64
  store i64 %casted89, i64* %off88
  %off90 = getelementptr i64, i64* %ptr87, i32 1
  store i64 %x1, i64* %off90
  %t92 = inttoptr i64 %g0 to i64*
  %a91 = getelementptr i64, i64* %t92, i32 0
  %g036 = load i64, i64* %a91
  %c93 = inttoptr i64 %g036 to i64 (i64, i64)*
  %r12 = call i64 %c93(i64 %g0, i64 %f9)
  ret i64 %r12

}

define i64 @f20(i64 %env44, i64 %x6) {
  %p2594 = alloca i64
  %p2295 = alloca i64
  %t97 = inttoptr i64 %env44 to i64*
  %a96 = getelementptr i64, i64* %t97, i32 1
  %f5 = load i64, i64* %a96
  %c98 = icmp sgt i64 %x6, 0
  br i1 %c98, label %then54, label %else55
then52:
  %r26 = sub i64 %x6, 1
  %t100 = inttoptr i64 %f5 to i64*
  %a99 = getelementptr i64, i64* %t100, i32 0
  %f545 = load i64, i64* %a99
  %c101 = inttoptr i64 %f545 to i64 (i64, i64)*
  %r27 = call i64 %c101(i64 %f5, i64 %r26)
  %r28 = mul i64 %x6, %r27
  store i64 %r28, i64* %p2594
  br label %j24
else53:
  store i64 1, i64* %p2594
  br label %j24
j24:
  %p25 = load i64, i64* %p2594
  store i64 %p25, i64* %p2295
  br label %j21
then54:
  %r23 = sub i64 %x6, 1
  %c102 = icmp sgt i64 %r23, 0
  br i1 %c102, label %then52, label %else53
else55:
  store i64 1, i64* %p2295
  br label %j21
j21:
  %p22 = load i64, i64* %p2295
  ret i64 %p22
}

define i64 @f19(i64 %env43, i64 %f5) {
  %ptr103 = call i64* @malloc(i64 16)
  %f20 = ptrtoint i64* %ptr103 to i64
  %off104 = getelementptr i64, i64* %ptr103, i32 0
  %casted105 = ptrtoint i64 (i64, i64)* @f20 to i64
  store i64 %casted105, i64* %off104
  %off106 = getelementptr i64, i64* %ptr103, i32 1
  store i64 %f5, i64* %off106
  ret i64 %f20

}

define i64 @f7(i64 %env31, i64 %g0) {
  %ptr107 = call i64* @malloc(i64 16)
  %f8 = ptrtoint i64* %ptr107 to i64
  %off108 = getelementptr i64, i64* %ptr107, i32 0
  %casted109 = ptrtoint i64 (i64, i64)* @f8 to i64
  store i64 %casted109, i64* %off108
  %off110 = getelementptr i64, i64* %ptr107, i32 1
  store i64 %g0, i64* %off110
  %ptr111 = call i64* @malloc(i64 16)
  %f13 = ptrtoint i64* %ptr111 to i64
  %off112 = getelementptr i64, i64* %ptr111, i32 0
  %casted113 = ptrtoint i64 (i64, i64)* @f13 to i64
  store i64 %casted113, i64* %off112
  %off114 = getelementptr i64, i64* %ptr111, i32 1
  store i64 %g0, i64* %off114
  %t116 = inttoptr i64 %f8 to i64*
  %a115 = getelementptr i64, i64* %t116, i32 0
  %f842 = load i64, i64* %a115
  %c117 = inttoptr i64 %f842 to i64 (i64, i64)*
  %r18 = call i64 %c117(i64 %f8, i64 %f13)
  ret i64 %r18

}

define i64 @main() {
  %ptr118 = call i64* @malloc(i64 8)
  %f7 = ptrtoint i64* %ptr118 to i64
  %off119 = getelementptr i64, i64* %ptr118, i32 0
  %casted120 = ptrtoint i64 (i64, i64)* @f7 to i64
  store i64 %casted120, i64* %off119
  %ptr121 = call i64* @malloc(i64 8)
  %f19 = ptrtoint i64* %ptr121 to i64
  %off122 = getelementptr i64, i64* %ptr121, i32 0
  %casted123 = ptrtoint i64 (i64, i64)* @f19 to i64
  store i64 %casted123, i64* %off122
  %t125 = inttoptr i64 %f7 to i64*
  %a124 = getelementptr i64, i64* %t125, i32 0
  %f746 = load i64, i64* %a124
  %c126 = inttoptr i64 %f746 to i64 (i64, i64)*
  %r29 = call i64 %c126(i64 %f7, i64 %f19)
  %t128 = inttoptr i64 %r29 to i64*
  %a127 = getelementptr i64, i64* %t128, i32 0
  %r2947 = load i64, i64* %a127
  %c129 = inttoptr i64 %r2947 to i64 (i64, i64)*
  %r30 = call i64 %c129(i64 %r29, i64 5)
  ret i64 %r30

}


declare i64* @malloc(i64)'
]

{ #category : #tests }
LcCompilerTest >> testFactorial5File [

	"
	Should create a file called 'fibonaccitest.ll' in the root directory of this image
	(on Linux it would be '~/Pharo/images/MyImage/fibonaccitest.ll' where 'MyImage' is the name of this image)
	"

	| program |
	program := '(fn g => (fn x => g (fn v => x x v)) (fn x => g (fn v => x x v))) (fn f => fn x => if x then (if x - 1 then x * f (x - 1) else 1) else 1) 5'.
	LcCompiler compile: program toFilename: 'fibonaccitest.ll'
]
