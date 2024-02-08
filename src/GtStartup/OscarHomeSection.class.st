Class {
	#name : #OscarHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtStartup-Sections'
}

{ #category : #accessing }
OscarHomeSection >> gtDemoCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard lazy
		title: 'GT Demos';
		description: 'Go to the GT Demos Lepiter database (load if needed)';
		databaseName: 'feenkcom/gtoolkit-demos/lepiter';
		pageName: 'GToolkitDemos TOC';
		loadLepiter: [ BaselineOfGToolkitDemos loadLepiter ];
		priority: 30;
		assertInvariant;
		yourself
]

{ #category : #accessing }
OscarHomeSection >> gtShortsCard [
	<gtSectionCard>
	<gtExample>
	(self repoIsPresent: 'gtoolkit-shorts') ifTrue: [ ^ GtHomeCard empty ].
	^ GtHomeCard jobs
		title: 'GT Shorts';
		description: 'Load the GT Shorts repo and database';
		priority: 50;
		jobs: {
			[ Metacello new
					baseline: 'GtoolkitShorts';
					repository: 'github://feenkcom/gtoolkit-shorts:main/src';
					load ].
			[ #BaselineOfGtoolkitShorts asClass loadLepiter ]};
		yourself
]

{ #category : #accessing }
OscarHomeSection >> gtVamosCard [
	"Open the VAMOS slideshow if it is present, else load the missing repos and lepiter DB."

	<gtSectionCard>
	<gtExample>
	Smalltalk globals
		at: #FkEmbracingVariabilitySlideshow
		ifPresent: [ ^ GtHomeCard jobs
				title: 'VAMOS 2024';
				description: 'Open the VAMOS slideshow';
				priority: 20;
				job: [ GtPresenterSlideShow openInSpace: #FkEmbracingVariabilitySlideshow asClass ];
				yourself ].
	^ GtHomeCard jobs
		title: 'VAMOS 2024';
		description: 'Open the VAMOS slideshow after loading the feenk-stories and Vamos repos';
		priority: 20;
		jobs: {[ Metacello new
					repository: 'github://feenkcom/feenk-stories:main/src';
					baseline: 'FeenkStories';
					load ].
				[ #BaselineOfFeenkStories asClass loadLepiter ].
				[ Metacello new
					repository: 'github://feenkcom/feenk-stories:main/src';
					baseline: 'FeenkEmbracingVariabilityVAMOS2024';
					load ].
				[ self updateGtWorld ].
				[ GtPresenterSlideShow openInSpace: #FkEmbracingVariabilitySlideshow asClass ]};
		yourself
]

{ #category : #accessing }
OscarHomeSection >> sectionTitle [
	^ 'Oscar''s Todos'
]

{ #category : #accessing }
OscarHomeSection >> todoCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
		title: 'Oscar''s Todos';
		description: 'Oscar''s Lepiter Database';
		priority: 10;
		pageName: 'ToDo';
		databaseName: LeDatabase primaryDB databaseName;
		assertInvariant;
		yourself
]

{ #category : #accessing }
OscarHomeSection >> updateGtWorld [
	<gtExample>
	^ GtWorld allInstances
		do: [ :aGtWorld | aGtWorld root children first home updateWidget ]
]
