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

