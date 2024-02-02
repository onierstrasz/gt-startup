Class {
	#name : #OscarHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtStartup-Sections'
}

{ #category : #accessing }
OscarHomeSection >> asapCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard new
		title: 'To do ASAP';
		priority: 20;
		page: (LeDatabase primaryDB pageNamed: 'ASAP');
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
	^ GtHomeCard new
		title: 'Oscar''s Todos';
		description: 'Oscar''s Lepiter Database';
		priority: 10;
		page: (LeDatabase primaryDB pageNamed: 'ToDo');
		yourself
]
