"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPastellTests,
	#superclass : #PackageManifest,
	#category : #'Pastell-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestPastellTests class >> ruleRBShouldntRaiseErrorRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PSTCollectionTest #testNew #false)) #'2019-11-18T11:16:13.647036+01:00') )
]

{ #category : #'code-critics' }
ManifestPastellTests class >> ruleRBUsesAddRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'Pastell-Tests')) #'2019-11-18T11:15:39.908036+01:00') )
]
