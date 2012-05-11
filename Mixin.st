Smalltalk current createPackage: 'Mixin' properties: #{}!
Object subclass: #Example
	instanceVariableNames: 'mixins'
	package: 'Mixin'!

!Example methodsFor: 'accessing'!

mixins
	^mixins
! !

!Example methodsFor: 'initialization'!

initialize
	"comment stating purpose of message"
	mixins := Dictionary new.
! !

!Object methodsFor: '*Mixin'!

doesNotUnderstand: aMessage
	"If the object has mixins, see if one responds to aMessage."
	(self class canUnderstand: #mixins) ifTrue: [
		self mixins do: [ :mixin |
			(mixin class canUnderstand: aMessage selector)
				ifTrue: [
					^mixin perform: aMessage selector 
                                                   withArguments: aMessage arguments
				].
		].
	].
"was not handled by mixin, so pass to original doesNotUnderstand handler"
^self originalDoesNotUnderstand: aMessage
!

oldDoesNotUnderstand: aMessage
	MessageNotUnderstood new
		receiver: self;
		message: aMessage;
		signal
! !

