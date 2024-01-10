Extension { #name : #GtHome }

{ #category : #'*GtStartup' }
GtHome >> demoSection [
	<gtHomeSection>
	BaselineOfGToolkitDemos loadLepiter.
	^ GtHomeStartPageSection new 
		title: 'GT Demos';
		description: 'GT Demos';
		databaseName: 'feenkcom/gtoolkit-demos/lepiter';
		startPageName: 'GToolkitDemos TOC';
		priority: 20
]

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
