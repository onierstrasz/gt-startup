"Show explicit referenced in compact form."
LePageToolContentTreeElement showIncomingReferencesInlined.

"Load startup repo if needed."
Smalltalk globals
	at: #BaselineOfGtStartup
	ifAbsent: [ Metacello new
			repository: 'github://onierstrasz/gt-startup:main/src';
			baseline: 'GtStartup';
			load.
		Smalltalk saveSession ].

Smalltalk saveAs: 'gt-startup'.