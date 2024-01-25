"
I am a home sction that can hold multiple cards. My cards are each defined in a method with a `<gtSectionCard>` pragma.
"
Class {
	#name : #GtHomeMultiCardPageSection,
	#superclass : #GtHomeStartPageSection,
	#category : #'GtStartup-Sections'
}

{ #category : #cards }
GtHomeMultiCardPageSection >> cardForPage: aPage [
	^ self
		cardTitled: aPage title
		forPage: aPage
		withDescription: aPage title
]

{ #category : #cards }
GtHomeMultiCardPageSection >> cardForPage: aPage withDescription: aDescription [
	^ self
		cardTitled: aPage title
		forPage: aPage
		withDescription: aDescription
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardForPageNamed: aPageName [
	^ self cardForPage: (self database pageNamed: aPageName)
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardForPageNamed: aPageName withDescription: aDescription [
	^ self
		cardForPage: (self database pageNamed: aPageName)
		withDescription: aDescription
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardMethods [
	^ self class methods select: [ :m | m hasPragmaNamed: 'gtSectionCard' ]
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardTitled: aCardTitle forPage: aPage [
	^ self
		cardTitled: aCardTitle
		forPage: aPage
		withDescription: aPage title
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardTitled: aCardTitle forPage: aPage withDescription: aDescription [
	^ self
		newHeaderCardWithTitle: aCardTitle
		description: aDescription
		size: 200 @ 150
		content: (BrLabel new
				text: aCardTitle;
				aptitude: BrGlamorousLabelAptitude new bold;
				padding: (BlInsets all: 20)) asScalableElement
		action: [ :card | 
			GtWorldUtility
				showSpaceWithTitle: aPage title
				inPagerWith: [ aPage asLepiterPagePhlowTool asElementDo: [ :e | e ] ]
						asStencil
				from: card ]
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardTitled: aCardTitle forPageNamed: aPageName [
	| page |
	page := self database pageNamed: aPageName.
	^ self
		cardTitled: aCardTitle
		forPage: page
		withDescription: page title
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cardTitled: aCardTitle forPageNamed: aPageName withDescription: aDescription [
	^ self
		cardTitled: aCardTitle
		forPage: (self database pageNamed: aPageName)
		withDescription: aDescription
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> cards [
	^ self cardMethods collect: [ :m | m valueWithReceiver: self arguments: #() ]
]

{ #category : #accessing }
GtHomeMultiCardPageSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: self sectionTitle).
	cardsContainer := self newCardsContainer.
	self cards do: [ :card | cardsContainer addChild: card ].
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
