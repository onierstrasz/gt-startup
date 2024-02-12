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
	^ GtHomeCard job
		title: 'GT Shorts';
		description: 'Load the GT Shorts repo and database';
		priority: 50;
		block: [ Smalltalk globals
				at: #BaselineOfGtoolkitShorts
				ifAbsent: [ Metacello new
						baseline: 'GtoolkitShorts';
						repository: 'github://feenkcom/gtoolkit-shorts:main/src';
						load.
					#BaselineOfGtoolkitShorts asClass loadLepiter.
					self updateGtWorld ] ];
		yourself
]

{ #category : #accessing }
OscarHomeSection >> gtStuffCard [
	"<gtSectionCard>"
	<gtExample>
	(self repoIsPresent: 'gt-stuff') ifTrue: [ ^ GtHomeCard empty ].
	^ GtHomeCard job
		title: 'GT Stuff';
		description: 'Load the GT stuff repo and database';
		priority: 50;
		block: [ Smalltalk globals
				at: #BaselineOfGtStuff
				ifAbsent: [ Metacello new
						repository: 'github://onierstrasz/gt-stuff:main/src';
						baseline: 'GtStuff';
						load.
					#BaselineOfGtStuff asClass loadLepiter.
					self updateGtWorld ] ];
		yourself
]

{ #category : #accessing }
OscarHomeSection >> gtVamosCard [
	"Open the VAMOS slideshow if it is present, else load the missing repos and lepiter DB."
	"<gtSectionCard>"
	<gtExample>
	^ GtHomeCard job
		title: 'VAMOS 2024';
		description: 'Open the VAMOS slideshow (load the feenk-stories and Vamos repos, if needed)';
		priority: 50;
		block: [ Smalltalk globals
				at: #FkEmbracingVariabilitySlideshow
				ifAbsent: [ Metacello new
						repository: 'github://feenkcom/feenk-stories:main/src';
						baseline: 'FeenkStories';
						load.
					#BaselineOfFeenkStories asClass loadLepiter.
					Metacello new
						repository: 'github://feenkcom/feenk-stories:main/src';
						baseline: 'FeenkEmbracingVariabilityVAMOS2024';
						load ].
			GtPresenterSlideShow openInSpace: #FkEmbracingVariabilitySlideshow asClass ];
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
