tests
testEpiceaBinary
	| benchmark dataset result |
	benchmark := STONEpiceaBenchmark new.
	benchmark factorForScale: 1.
	dataset := benchmark dataset.
	benchmark writeAscii.
	self assert: benchmark datasetFileSize > 0.
	result := benchmark readAscii.
	self assert: result size equals: benchmark factor * dataset size.
	"We can compare only the STONTestDomainObject instances, sadly"
	2 to: dataset size by: 2 do: [ :each |
		self assert: (result at: each) equals: (dataset at: each) ].
	benchmark datasetFile ensureDelete