private
stringStreamContents: block
	stringStream
		ifNil: [
			stringStream := (String new: 32) writeStream ]
		ifNotNil: [
			stringStream originalContents isWideString
				ifTrue: [ stringStream := (String new: 32) writeStream ]
				ifFalse: [ stringStream reset ] ].
	block value: stringStream.
	^ stringStream contents