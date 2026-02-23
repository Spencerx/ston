parsing
parseNamedInstVarsFor: anObject
	anObject stonUseAccessors
		ifTrue: [ 
			self parseMapDo: [ :instVarName :value |
				anObject perform: instVarName asMutator with: value ] ]
		ifFalse: [ | objectClass |
			objectClass := anObject class.
			self parseMapDo: [ :instVarName :value |
				objectClass
					slotNamed: instVarName
						ifFound: [ :slot | slot write: value to: anObject ]
						ifNone: [ InstanceVariableNotFound signalFor: instVarName asString ] ] ]