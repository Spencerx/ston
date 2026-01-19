accessing
dataset
	^ dataset ifNil: [ dataset := self newDataset ]