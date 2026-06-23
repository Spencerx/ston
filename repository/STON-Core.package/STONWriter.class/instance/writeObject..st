writing
writeObject: anObject
	| instanceVariableNames |
	instanceVariableNames := anObject stonUseAccessors 
		ifTrue: [ anObject class allInstVarNames ]
		ifFalse: [ anObject class stonAllInstVarNames ].
	instanceVariableNames
		ifEmpty: [
			self writeObject: anObject do: [ self encodeMap: #() ] ]
		ifNotEmpty: [
			self writeObject: anObject streamMap: [ :dictionary |
				instanceVariableNames do: [ :each |
					(anObject stonUseAccessors 
							ifTrue: [ anObject perform: each ]
							ifFalse: [ anObject readSlotNamed: each ])
						ifNotNil: [ :value |
							dictionary at: each asSymbol put: value ]
						ifNil: [
							anObject stonShouldWriteNilInstVars
								ifTrue: [ dictionary at: each asSymbol put: nil ] ] ] ] ]
