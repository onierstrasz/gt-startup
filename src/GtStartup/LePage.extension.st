Extension { #name : #LePage }

{ #category : #'*GtStartup' }
LePage >> gtZoomInButtonFor: anAction [
	<lePageAction>
	^ anAction button
		tooltip: 'Zoom in';
		priority: 10;
		icon: BrGlamorousVectorIcons up;
		action: [ :aButton :aModel :anEvent | BlGlutinHostSpace zoomFactor: BlGlutinHostSpace zoomFactor * 1.2 ]
]

{ #category : #'*GtStartup' }
LePage >> gtZoomOutButtonFor: anAction [
	<lePageAction>
	^ anAction button
		tooltip: 'Zoom out';
		priority: 11;
		icon: BrGlamorousVectorIcons down;
		action: [ :aButton :aModel :anEvent | BlGlutinHostSpace zoomFactor: BlGlutinHostSpace zoomFactor / 1.2 ]
]
