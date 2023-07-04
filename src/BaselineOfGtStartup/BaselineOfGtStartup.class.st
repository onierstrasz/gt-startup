Class {
	#name : #BaselineOfGtStartup,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtStartup
}

{ #category : #loading }
BaselineOfGtStartup class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-startup' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtStartup >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtStartup'
		]
]
