operations
writeAscii
	self datasetFile 
		ensureDelete; 
		writeStreamEncoded: #null do: [ :out |
			self factor timesRepeat: [
				"Make sure to create a new writer for each iteration,
				else structure sharing will kick in and after the first iteration,
				the next iterations will all be references"
				self dataset do: [ :each |
					(STON writer on: out)
						asciiOnly: true; 
						prettyPrint: true;
						nextPut: each; 
						newlineIndent ] ] ]