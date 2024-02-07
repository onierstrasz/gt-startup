Extension { #name : #GtHomeMultiCardGetStartedSection }

{ #category : #'*GtStartup' }
GtHomeMultiCardGetStartedSection >> patternsCard [
	<gtSectionCard>
	<gtExample>
	<notest>
	^ GtHomeCard page
		priority: 20;
		pageName: 'Moldable Development patterns';
		databaseName: self gtBookName;
		yourself
]

{ #category : #'*GtStartup' }
GtHomeMultiCardGetStartedSection >> reflectionCard [
	<gtSectionCard>
	<gtExample>
	<notest>
	^ GtHomeCard page
		priority: 30;
		pageName: 'Understanding reflection';
		databaseName: self gtBookName;
		yourself
]
