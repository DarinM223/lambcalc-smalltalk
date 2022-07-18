"
I rename all classes in my package to have a given prefix, such as ""DM"".
"
Class {
	#name : #PrefixRenamer,
	#superclass : #Object,
	#category : #'Lambcalc-Prefix'
}

{ #category : #'menu - change set' }
PrefixRenamer class >> addPrefix: aPrefix [

	((RPackageOrganizer default packageNamed: 'Lambcalc') classTags 
		 flatCollect: [ :tag | tag classes ]) do: [ :class | 
		(class name beginsWith: aPrefix) ifFalse: [ 
			(RBRenameClassRefactoring
				 rename: class name
				 to: aPrefix , class name) execute ] ]
]

{ #category : #'menu - change set' }
PrefixRenamer class >> removePrefix: aPrefix [

	((RPackageOrganizer default packageNamed: 'Lambcalc') classTags 
		 flatCollect: [ :tag | tag classes ]) do: [ :class | 
		(class name beginsWith: aPrefix) ifTrue: [ 
			(RBRenameClassRefactoring
				 rename: class name
				 to: (class name allButFirst: aPrefix size)) execute ] ]
]
