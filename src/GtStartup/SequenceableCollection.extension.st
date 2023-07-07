Extension { #name : #SequenceableCollection }

{ #category : #'*GtStartup' }
SequenceableCollection >> sortBy: aBlockOrSymbol [
	^ self sort: [ :a :b | (aBlockOrSymbol value: a) < (aBlockOrSymbol value: b) ]
]
