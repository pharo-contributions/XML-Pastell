"
Baseline for an XPath-like DSL that makes navigation in XML DOM trees easier. (see https://github.com/pharo-contributions/XML-Pastell)
"
Class {
	#name : #BaselineOfPastell,
	#superclass : #BaselineOf,
	#category : #BaselineOfPastell
}

{ #category : #baseline }
BaselineOfPastell >> baselineOf: spec [
	<baseline>
	spec
		for: #common
		do: [
			
			self xmlParserOn: spec.		
			
			"Packages"
			spec 
				package: 'Pastell-Base' with: [ spec requires: #('XMLParser') ];
				package: 'Pastell-Tests' with: [ spec requires: #('XMLParser Tests' 'Pastell-Tests') ].
			
			"Groups"
			spec
				group: 'Core' with: #('Pastell-Base');
				group: 'Tools' with: #('XMLParser Tools'); 
				group: 'Tests' with: #('Pastell-Tests');	
				group: 'all' with: #('Core' 'Tools' 'Tests');
				group: 'default' with: #('all')	
	]
]

{ #category : #baseline }
BaselineOfPastell >> xmlParserOn: spec [

	spec
		baseline: 'XMLParser'
      with: [ 
			spec
				loads: #('Core');
				repository: 'github://pharo-contributions/XML-XMLParser:3.5.x/src' ]. 
				
	spec 
		project: 'XMLParser Tests' copyFrom: 'XMLParser' with: [ spec loads: #('Tests') ]; 	
		project: 'XMLParser Tools' copyFrom: 'XMLParser' with: [ spec loads: #('Tools') ] 
]
