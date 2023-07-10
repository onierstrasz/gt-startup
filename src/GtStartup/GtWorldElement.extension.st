Extension { #name : #GtWorldElement }

{ #category : #'*GtStartup' }
GtWorldElement >> newActionItemsInto: anActionbar [
	super newActionItemsInto: anActionbar.
	anActionbar addItem: self newScaleUpButton.
	anActionbar addItem: self newScaleDownButton.
	anActionbar addItem: self newNotificationsBadge.
	anActionbar addItem: self newSpotterButton.
	anActionbar addItem: self newStatusButton.
	GtImage isSyncEnabled ifTrue: [
		anActionbar addItem: self newSynchronizeButton].
	anActionbar addItem: self newSubSpaceButton.
]

{ #category : #'*GtStartup' }
GtWorldElement >> newScaleDownButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
		label: 'Scale down UI';
		icon: BrGlamorousVectorIcons remove;
		action: [ :aButton :aModel :anEvent | BlGlutinHostSpace zoomFactor: BlGlutinHostSpace zoomFactor / 1.2 ]
]

{ #category : #'*GtStartup' }
GtWorldElement >> newScaleUpButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
		label: 'Scale up UI';
		icon: BrGlamorousVectorIcons add;
		action: [ :aButton :aModel :anEvent | BlGlutinHostSpace zoomFactor: BlGlutinHostSpace zoomFactor * 1.2 ]
]
