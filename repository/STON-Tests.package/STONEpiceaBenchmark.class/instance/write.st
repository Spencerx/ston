operations
write
	self datasetFile 
		ensureDelete; 
		writeStreamDo: [ :out |
			self factor timesRepeat: [
				"Make sure to create a new writer for each iteration,
				else structure sharing will kick in and after the first iteration,
				the next iterations will all be references"
				self dataset do: [ :each |
					(STON writer on: out) 
						prettyPrint: true;
						nextPut: each; 
						newlineIndent ] ] ]