Extension { #name : #GtHome }

{ #category : #'*GtStartup' }
GtHome >> oscarSection [
	<gtHomeSection>
	<gtExample>
	<noTest>
	^ OscarHomeSection new
		priority: 10;
		yourself
]
