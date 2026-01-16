parsing
parseNamedInstVarsFor: anObject
	| objectClass |
	objectClass := anObject class.
	self parseMapDo: [ :instVarName :value |
		objectClass
			slotNamed: instVarName
			ifFound: [ :slot | slot write: value to: anObject ]
			ifNone: [ InstanceVariableNotFound signalFor: instVarName asString ] ]