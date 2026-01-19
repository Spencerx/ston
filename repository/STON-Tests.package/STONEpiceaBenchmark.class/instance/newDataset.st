accessing
newDataset
	^ ZnClient methods flatCollect: [ :each |
			| dummy |
			dummy := STONTestDomainObject dummy.
			"Give ~5% of created objects a non-ASCII description, to include UTF-8 encoding and WideStrings"
			100 atRandom <= 5 ifTrue: [
				dummy description: dummy description , '€å' atRandom asString ].
			{
				OmEntry content: (EpMethodAddition method: each).
				dummy 
			} ]