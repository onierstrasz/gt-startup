# gt-startup
Demo for loading stuff at startup.

NB: I am now using a different, private startup repo.

## Installation

```
Metacello new
	repository: 'github://onierstrasz/gt-startup:main/src';
	baseline: 'GtStartup';
	load
```

## Load Lepiter
				
After installing with Metacello, you will be able to execute

```
#BaselineOfGtStartup asClass loadLepiter
```

