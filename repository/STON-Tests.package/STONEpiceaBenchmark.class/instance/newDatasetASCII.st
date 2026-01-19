accessing
newDatasetASCII
	^ ZnClient methods flatCollect: [ :each |
			{
				OmEntry content: (EpMethodAddition method: each).
				STONTestDomainObject dummy 
			} ]