tests
testDomainObjectUsingAccessors
	| object objects |
	object := STONTestDomainObjectUsingAccessors dummy.
	self serializeAndMaterialize: object.
	objects := STON listClass streamContents: [ :stream |
		10 timesRepeat: [ stream nextPut: STONTestDomainObjectUsingAccessors dummy ] ].
	self serializeAndMaterialize: objects.
	objects := STON mapClass new.
	10 timesRepeat: [ | newObject |
		newObject := STONTestDomainObjectUsingAccessors dummy.
		objects at: newObject integer put: newObject ].
	self serializeAndMaterialize: objects