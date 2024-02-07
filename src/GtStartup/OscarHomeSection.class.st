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
		description: 'GT Demos';
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
		jobs: {'Loading gtoolkit-shorts repo'
					-> [ Metacello new
							baseline: 'GtoolkitShorts';
							repository: 'github://feenkcom/gtoolkit-shorts:main/src';
							load ].
				'Loading GtoolkitShorts lepiter'
					-> [ #BaselineOfGtoolkitShorts asClass loadLepiter ]};
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
