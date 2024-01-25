Class {
	#name : #OscarHomeSection,
	#superclass : #GtHomeMultiCardPageSection,
	#category : #'GtStartup-Sections'
}

{ #category : #accessing }
OscarHomeSection >> card1ToDo [
	<gtSectionCard>
	<gtExample>
	^ self
		cardTitled: 'Oscar''s Todos'
		forPageNamed: 'ToDo'
		withDescription: 'Oscar''s Lepiter Database'
]

{ #category : #accessing }
OscarHomeSection >> card2ASAP [
	<gtSectionCard>
	<gtExample>
	^ self cardForPageNamed: 'ASAP'
]
