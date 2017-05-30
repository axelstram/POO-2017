!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'unMetro dosMetros tresMetros cincoCentimetros cienCentimetros milMilimetros unMedioMetro diezKilometros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'setup' stamp: 'AS 5/29/2017 20:43:12'!
setUp

	unMetro := Meter withSize: 1.
	dosMetros := Meter withSize: 2.
	tresMetros := Meter withSize: 3.
	cincoCentimetros := Centimeter withSize: 5.
	cienCentimetros := Centimeter withSize: 100.
	milMilimetros := Milimeter withSize: 1000.
	unMedioMetro := Meter withSize: 0.5.
	diezKilometros := Kilometer withSize: 10.! !


!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:30:58'!
test01OneMeterIsEqualToOneMeter

	self assert: unMetro = unMetro .! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 20:23:40'!
test02aMeterCanNotBeNegative
	 [Meter withSize: -1]
	on: Error 
	do: [ :anErrorMessage | self assert: anErrorMessage messageText = Meter canNotCreateNegativeOrZeroMeasureErrorMessage].
	
	! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:31:13'!
test03OneMeterPlusOneMeterShouldEqualTwoMeters
	self assert: (unMetro + unMetro ) = dosMetros .! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:31:19'!
test04OneMeterMustEqualOneHundredCentimeters
	self assert: unMetro = cienCentimetros .! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:31:35'!
test05OneHundredCentimetersMustEqualOneThousandMilimeters
	self assert: cienCentimetros = milMilimetros.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:31:48'!
test06TwoMetersMinusOneHundredCentimetersMustEqualOneThousandMilimeters
	self assert: dosMetros - cienCentimetros = milMilimetros.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:45:32'!
test07AMeterTimesTwoMustEqualTwoMeters
	self assert: [(unMetro * 2 = dosMetros ) and: (2 * unMetro = dosMetros)].! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:47:41'!
test08AMeterDividedByTwoMustEqualHalfAMeter
	self assert: unMetro / 2 = unMedioMetro.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:51:44'!
test09TenKilometersMustBeGreaterThanAMeter
	self assert: diezKilometros > unMetro.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:56:30'!
test10OneMeterIsLessThanThreeMeters
	self assert: unMetro < tresMetros! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 19:59:02'!
test11TenKilometersIsGreaterOrEqualThanOneMeter
	self assert: diezKilometros >= unMetro! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 20:00:09'!
test12OneMeterIsLessThanOrEqualToThreeMeters
	self assert: unMetro <= tresMetros! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 20:38:50'!
test13OneMeterToThreeMetersMustEqualAnIntervalFromOneToThree
	self assert: (unMetro to: tresMetros) = (1 to: 3).! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 20:48:33'!
test14OneMeterToTenKilometersWithAStepOfFiveCentimetersMustEqualAnIntervalFromOneToTenThousandWithStepsOf05
	self assert: (unMetro to: diezKilometros by: cincoCentimetros) = (1 to: 10000 by: 5/100).! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/29/2017 23:00:09'!
test15ForOneMeterToTenKilometersByFiveCentimetersItShouldDoATaks
	| counter |
	
	counter := 0.
	self assert: (unMetro to: diezKilometros by: cincoCentimetros do: [:i | counter := counter + 1 ] ) = (1 to: 10000 by: 5/100 do: [:i | counter := counter + 1 ]).! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:21:21'!
minusOneMeter
	^Meter withSize: -1! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:21:37'!
oneCentimeter
	^Centimeter withSize: 1! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:01'!
oneHundredCentimeters
	^Centimeter withSize: 100.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:14'!
oneMeter
	^Meter withSize: 1.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:25'!
twoHundredCentimeters
	^Centimeter withSize: 200.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:39'!
twoMeters
	^Meter withSize: 2.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:51'!
zeroMeters
	^Meter withSize: 0.! !


!classDefinition: #Measure category: #'Distance-Solution'!
Object subclass: #Measure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Distance-Solution'!
Measure class
	instanceVariableNames: ''!

!Measure class methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:23:07'!
assertIsPositive: aSize
	aSize <= 0 ifTrue: [ self error: self canNotCreateNegativeOrZeroMeasureErrorMessage ]
! !

!Measure class methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:23:25'!
canNotCreateNegativeOrZeroMeasureErrorMessage
	^'Cannot create a measure with negative or zero size'! !


!classDefinition: #Centimeter category: #'Distance-Solution'!
Measure subclass: #Centimeter
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:29:16'!
* aSize
	^Centimeter withSize: size * aSize.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:26:38'!
+ aMeasure
	^aMeasure addACentimeter: self.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:09:36'!
- aMeasure
	^aMeasure subtractToACentimeter: self.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:55:16'!
= anObject
	^size = anObject toCentimeters! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:27:29'!
addACentimeter: aCentimeter
	^Centimeter withSize: (aCentimeter size + self size).
! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:42:18'!
addAMeter: aMeter
	^Centimeter withSize: (aMeter toCentimeters + self size).
! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:54:16'!
addAMilimiter: aMilimeter
	^Meter withSize: (aMilimeter toCentimeters + self size).
! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:39:33'!
initializeWith: aSize
	super initialize.
	size := aSize.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:37:16'!
size
	^size! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:11:18'!
subtractToACentimeter: aCentimeter
	| newMeasure |
	
	newMeasure := aCentimeter size - self size.
	Measure assertIsPositive: newMeasure.
	
	^Centimeter withSize: (newMeasure).! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:20:10'!
subtractToAMeter: aMeter
	| newMeasure |
	
	newMeasure := aMeter toCentimeters - self size.
	Measure assertIsPositive: newMeasure.
	
	^Centimeter withSize: (newMeasure).! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:20:16'!
subtractToAMilimeter: aMilimeter
	| newMeasure |
	
	newMeasure := aMilimeter toCentimeters - self size.
	Measure assertIsPositive: newMeasure.
	
	^Centimeter withSize: (newMeasure).! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:55:24'!
toCentimeters
	^size.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:10:05'!
toKilometer
	^size / 100000.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:41:14'!
toMeters
	^size / 100.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:56:10'!
toMilimeters
	^size * 10.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimeter class' category: #'Distance-Solution'!
Centimeter class
	instanceVariableNames: ''!

!Centimeter class methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:39:49'!
withSize: aSize
	Measure assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #Kilometer category: #'Distance-Solution'!
Measure subclass: #Kilometer
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:53:24'!
< aMeasure
	^ self size < aMeasure toKilometers.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:57:59'!
<= aMeasure
	^ (self size < aMeasure toKilometers) or: (self size = aMeasure toKilometers). ! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:11:02'!
= anObject
	^size = anObject toKilometer.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:50:35'!
> aMeasure
	^ self size > aMeasure toKilometers.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:57:51'!
>= aMeasure
	^ (self size > aMeasure toKilometers) or: (self size = aMeasure toKilometers). ! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:49:26'!
initializeWith: aSize
	super initialize.
	size := aSize.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:52:54'!
size
	^size! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:10:43'!
toCentimeter
	^size * 100000.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:10:20'!
toKilometer
	^size.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:36:50'!
toMeters
	^size * 1000.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:10:50'!
toMilimeter
	^size * 1000000.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Kilometer class' category: #'Distance-Solution'!
Kilometer class
	instanceVariableNames: ''!

!Kilometer class methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:48:56'!
withSize: aSize
	Measure assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #Meter category: #'Distance-Solution'!
Measure subclass: #Meter
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:29:02'!
* aSize
	^Meter withSize: size * aSize.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/23/2017 19:13:11'!
+ aMeasure
	^aMeasure addAMeter: self.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:08:18'!
- aMeasure
	^aMeasure subtractToAMeter: self.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:47:00'!
/ aNumber
	^Meter withSize: (self size / aNumber).! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:55:39'!
< aMeasure
	^self size < aMeasure toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:59:30'!
<= aMeasure
	^ (self size < aMeasure toMeters) or: (self size = aMeasure toMeters). ! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:54:33'!
= anObject
	^size = anObject toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:53:42'!
> aMeasure
	^self size > aMeasure toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:59:40'!
>= aMeasure
	^ (self size > aMeasure toMeters) or: (self size = aMeasure toMeters). ! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:38:31'!
adaptToInteger: anInteger andSend: selector
	^Meter withSize: (anInteger perform: selector with: self size).
	! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:41:42'!
addACentimeter: aCentimeter
	^Meter withSize: (aCentimeter toMeters + self size).
! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/23/2017 19:13:42'!
addAMeter: aMeter
	^Meter withSize: (aMeter size + self size).
! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:53:45'!
addAMilimiter: aMilimeter
	^Meter withSize: (aMilimeter toMeters + self size).
! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:34:19'!
initializeWith: aSize
	super initialize.
	size := aSize.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:36:46'!
size
	^size! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:21:16'!
subtractToACentimeter: aCentimeter
	| newMeasure |
	
	newMeasure := aCentimeter toMeters - self size.
	Measure assertIsPositive: newMeasure.
	
	^Meter withSize: (newMeasure).! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:08:27'!
subtractToAMeter: aMeter
	| newMeasure |
	
	newMeasure := aMeter size - self size.
	Measure assertIsPositive: newMeasure.
	
	^Meter withSize: (newMeasure).
! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:21:19'!
subtractToAMilimeter: aMilimeter
	| newMeasure |
	
	newMeasure := aMilimeter toMeters - self size.
	Measure assertIsPositive: newMeasure.
	
	^Meter withSize: (newMeasure).! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:39:40'!
to: aMeasure
	^(self size) to: (aMeasure toMeters) by: 1.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:42:11'!
to: aMeasure by: step
	^(self size) to: (aMeasure toMeters) by: step toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 22:55:13'!
to: aMeasure by: step do: aTask
	^(self size) to: (aMeasure toMeters) by: step toMeters do: aTask.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:41:36'!
toCentimeters
	^size * 100.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:49:55'!
toKilometers
	^size / 1000.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:54:12'!
toMeters
	^size.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:56:01'!
toMilimeters
	^size * 1000.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Meter class' category: #'Distance-Solution'!
Meter class
	instanceVariableNames: ''!

!Meter class methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:39:08'!
withSize: aSize
	Measure assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #Milimeter category: #'Distance-Solution'!
Measure subclass: #Milimeter
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:29:24'!
* aSize
	^Milimeter withSize: size * aSize.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:54:01'!
+ aMeasure
	^aMeasure addAMilimiter: self.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:02:50'!
- aMeasure
	^aMeasure subtractAMilimeter: self.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:55:01'!
= anObject
	^size = anObject toMilimeters! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:55:56'!
addACentimeter: aCentimeter
	^Milimeter withSize: (aCentimeter toMilimeters + self size).
! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:57:10'!
addAMeter: aMeter
	^Milimeter withSize: (aMeter toMilimeters + self size).
! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:57:28'!
addAMilimiter: aMilimeter
	^Milimeter withSize: (aMilimeter size + self size).
! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:57:36'!
initializeWith: aSize
	super initialize.
	size := aSize.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:57:43'!
size
	^size! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:21:25'!
subtractToACentimeter: aCentimeter
	| newMeasure |
	
	newMeasure := aCentimeter toMilimeters - self size.
	Measure assertIsPositive: newMeasure.
	
	^Milimeter withSize: (newMeasure).! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:21:29'!
subtractToAMeter: aMeter
	| newMeasure |
	
	newMeasure := aMeter toMilimeters - self size.
	Measure assertIsPositive: newMeasure.
	
	^Milimeter withSize: (newMeasure).! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 19:12:17'!
subtractToAMilimeter: aMilimeter
	| newMeasure |
	
	newMeasure := aMilimeter size - self size.
	Measure assertIsPositive: newMeasure.
	
	^Milimeter withSize: (newMeasure).! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:57:55'!
toCentimeters
	^size / 10.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:09:25'!
toKilometer
	^size / 1000000.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:58:16'!
toMeters
	^size / 1000.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:54:46'!
toMilimeters
	^size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeter class' category: #'Distance-Solution'!
Milimeter class
	instanceVariableNames: ''!

!Milimeter class methodsFor: 'as yet unclassified' stamp: 'AS 5/28/2017 16:52:30'!
withSize: aSize
	Measure assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !