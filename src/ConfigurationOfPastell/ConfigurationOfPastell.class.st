"
(ConfigurationOfPastell project version: #stable) load

(ConfigurationOfPastell project version: #development) load: 'Tests'
"
Class {
	#name : #ConfigurationOfPastell,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfPastell
}

{ #category : #'development support' }
ConfigurationOfPastell class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfPastell class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfPastell class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfPastell class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfPastell class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfPastell class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfPastell class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfPastell class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfPastell class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfPastell class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfPastell >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.squeaksource.com/Pastell'.
		spec package: 'Pastell'.
		spec group: 'default' with: #('Pastell' ). ].

]

{ #category : #baselines }
ConfigurationOfPastell >> baseline11: spec [
	<version: '1.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'Adding dependency to XMLParser'.
		spec repository: 'http://smalltalkhub.com/mc/PharoExtras/Pastell/main'.
	
	"depending on XMLParser"
	spec project: 'XMLParser'
					with: [ spec 
								className: 'ConfigurationOfXMLParser';
								versionString: #stable;
								repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main'.].
							
	"Now we express the dependency at the package level"
	
	spec package: 'Pastell' with: [spec requires: 'XMLParser'].		
	spec group: 'default' with: #('Pastell' )
	].

]

{ #category : #baselines }
ConfigurationOfPastell >> baseline12: spec [
	<version: '1.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'With now two packages'.
		spec repository: 'http://smalltalkhub.com/mc/PharoExtras/Pastell/main'.
	
	"depending on XMLParser"
	spec project: 'XMLParser'
					with: [ spec 
								className: 'ConfigurationOfXMLParser';
								versionString: #stable;
								repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main'.].
							
	"Now we express the dependency at the package level"
	
	spec package: 'Pastell-Base' with: [spec requires: 'XMLParser'].		
	spec package: 'Pastell-Tests' with: [ spec requires: 'Pastell-Base' ].
	spec group: 'default' with: #('Core' 'Tests' ).
	"default by default is equivalent to loading 'ALL' the packages still we added explicitly Tests to be loaded"
	spec group: 'Core' with: #('Pastell-Base' ).
	spec group: 'Tests' with: #('Pastell-Tests' )
	].

]

{ #category : #'symbolic versions' }
ConfigurationOfPastell >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfPastell >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfPastell >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.3'.

]

{ #category : #versions }
ConfigurationOfPastell >> version10: spec [
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '1.0 : First shoot!'.
		spec author: 'AlexandreBergel'.
		spec timestamp: '9/12/2012 11:42'.
		spec package: 'Pastell' with: 'Pastell-AlexandreBergel.21'. ].

]

{ #category : #versions }
ConfigurationOfPastell >> version11: spec [
	<version: '1.1' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '1.0 : First shoot!'.
		spec author: 'AlexandreBergel'.
		spec timestamp: '9/12/2012 11:43'.
		spec package: 'Pastell' with: 'Pastell-AlexandreBergel.21'. ].

]

{ #category : #versions }
ConfigurationOfPastell >> version12: spec [
	<version: '1.2' imports: #('1.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'New decent baseline; before splitting the packages in two'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '03/03/2013 16:43'.
		spec package: 'Pastell' with: 'Pastell-AlexandreBergel.21'. ].

]

{ #category : #versions }
ConfigurationOfPastell >> version13: spec [
	<version: '1.3' imports: #('1.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'Splitting in two packages and adding groups'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '03/03/2013 16:43'.
		spec package: 'Pastell-Base' with: 'Pastell-Base-StephaneDucasse.2'. 
		spec package: 'Pastell-Tests' with: 'Pastell-Tests-AlexandreBergel.1'. ].

]
