Extension { #name : #GtHome }

{ #category : #'*GtStartup' }
GtHome >> oscarSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Oscar''s Todos';
		description: 'Oscar''s Lepiter Database';
		databaseName: 'Documents/lepiter/default';
		startPageName: 'ToDo';
		priority: 8
]
