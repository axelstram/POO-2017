!classDefinition: #CustomerAlreadyExists category: #'Idiom-Exercise'!
Error subclass: #CustomerAlreadyExists
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!


!classDefinition: #CustomerNameIsEmpty category: #'Idiom-Exercise'!
Error subclass: #CustomerNameIsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!


!classDefinition: #CustomerNotFound category: #'Idiom-Exercise'!
Error subclass: #CustomerNotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!


!classDefinition: #IdiomTest category: #'Idiom-Exercise'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!IdiomTest methodsFor: 'testing' stamp: 'AS 4/24/2017 20:43:48'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook  new.
	
	self assert: ( 	[customerBook addCustomerNamed: 'John Lennon'.] shouldNotTakeMoreThan: 50 milliSeconds )
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'AS 4/24/2017 20:44:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook  new.
	customerBook addCustomerNamed: 'Paul McCartney'.
	
	self assert: ( [ customerBook removeCustomerNamed: 'Paul McCartney'.] shouldNotTakeMoreThan: 100 milliSeconds ).	
! !

!IdiomTest methodsFor: 'testing' stamp: 'AS 4/24/2017 21:40:15'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self assert: ([ customerBook addCustomerNamed: ''. ] ifItFailsThenItThrows: CustomerNameIsEmpty 
																    AndIsTrueThat: (customerBook isEmpty ))
	! !

!IdiomTest methodsFor: 'testing' stamp: 'AS 4/24/2017 21:58:48'!
test04CanNotRemoveAndInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assert: ([ customerBook removeCustomerNamed: 'Paul McCartney'. ]
					ifItFailsThenItThrows: CustomerNotFound 
				     AndIsTrueThat: ((customerBook numberOfCustomers = 1) and: (customerBook includesCustomerNamed: johnLennon)))! !


!classDefinition: #CustomerBook category: #'Idiom-Exercise'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'AS 4/20/2017 20:54:35'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ CustomerNameIsEmpty signal ].
	(customers includes: aName) ifTrue: [ CustomerAlreadyExists signal].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AS 4/24/2017 21:36:57'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ CustomerNotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'Idiom-Exercise'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
