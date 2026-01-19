operations
read
	| totalSize |
	totalSize := self dataset size * self factor.
	^ self datasetFile readStreamDo: [ :in |
		| ston |
		"Make sure to keep using the same STONReader so that the expensive
		class lookup is cached (see STONReader>>#lookupClass:)"
		ston := STON reader on: in.
		"Presize the Array/WriteStream so that growing in not a factor"
		Array
			new: totalSize 
			streamContents: [ :out |
				[ in atEnd ] whileFalse: [ 
					out nextPut: ston next.
					"Make sure to reset the object's seen cache"
					ston reset ] ] ] 