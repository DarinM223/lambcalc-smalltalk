"
I rename all classes in my package to have a prefix of ""DM"".
"
Class {
	#name : #PrefixRenamer,
	#superclass : #Object,
	#category : #Lambcalc
}

{ #category : #'menu - change set' }
PrefixRenamer class >> rename [

	((RPackageOrganizer default packageNamed: 'Lambcalc') classTags 
		 flatCollect: [ :tag | tag classes ]) do: [ :class | 
		(class name beginsWith: 'DM') ifFalse: [ 
			class rename: 'DM' , class name ] ]
]

{ #category : #'menu - change set' }
PrefixRenamer class >> unrename [

	((RPackageOrganizer default packageNamed: 'Lambcalc') classTags 
		 flatCollect: [ :tag | tag classes ]) do: [ :class | 
		(class name beginsWith: 'DM') ifTrue: [ 
			class rename: (class name allButFirst: 2).
			 ] ]
]
