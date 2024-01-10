"This is a sample startup script. It will be run whenever you start up a GT image. Put whatever you like in here."

"Show explicit references in compact form."
LePageToolContentTreeElement showIncomingReferencesInlined.

"Scale up the UI."
BlGlutinHostSpace zoomFactor: 1.2.

"Load my startup repo, if it's not already loaded."
Smalltalk globals
	at: #BaselineOfGtStartup
	ifAbsent: [ Metacello new
			repository: 'github://onierstrasz/gt-startup:main/src';
			baseline: 'GtStartup';
			load.
		Smalltalk saveSession ].

"Save this as a fresh image."
"Smalltalk saveAs: 'gt-startup'."
