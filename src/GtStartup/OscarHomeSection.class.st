Class {
	#name : #OscarHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtStartup-Sections'
}

{ #category : #accessing }
OscarHomeSection >> asapCard [
	"<gtSectionCard>"
	<gtExample>
	^ GtHomeCard page
		title: 'To do ASAP';
		priority: 20;
		pageName: 'ASAP';
		databaseName: LeDatabase primaryDB databaseName;
		yourself
]

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
		priority: 30
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
		yourself
]
