Extension { #name : #GtWorldElement }

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
