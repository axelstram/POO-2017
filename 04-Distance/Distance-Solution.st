!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'distanceFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'setup' stamp: 'AS 5/30/2017 09:00:40'!
setUp
	
	distanceFactory := DistanceFactory new.
	! !


!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:00:55'!
test01OneMeterIsEqualToOneMeter

	self assert: distanceFactory oneMeter = distanceFactory oneMeter ! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 14:08:57'!
test02aMeterCanNotBeNegative
	 [distanceFactory minusOneMeter]
	on: Error 
	do: [ :anErrorMessage | self assert: anErrorMessage messageText = Distance canNotCreateNegativeOrZeroDistanceErrorMessage].
	
	! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:01:32'!
test03OneMeterPlusOneMeterShouldEqualTwoMeters
	self assert: (distanceFactory oneMeter + distanceFactory oneMeter) = distanceFactory twoMeters.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:01:57'!
test04OneMeterMustEqualOneHundredCentimeters
	self assert: distanceFactory oneMeter = distanceFactory oneHundredCentimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:03:05'!
test05OneHundredCentimetersMustEqualOneThousandMilimeters
	self assert: distanceFactory oneHundredCentimeters = distanceFactory oneThousandMilimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:04:01'!
test06TwoMetersMinusOneHundredCentimetersMustEqualOneThousandMilimeters
	self assert: distanceFactory twoMeters - distanceFactory oneHundredCentimeters = distanceFactory oneThousandMilimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:04:41'!
test07AMeterTimesTwoMustEqualTwoMeters
	self assert: [(distanceFactory oneMeter * 2 = distanceFactory twoMeters) and: (2 * distanceFactory oneMeter = distanceFactory twoMeters)].! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:05:38'!
test08AMeterDividedByTwoMustEqualHalfAMeter
	self assert: distanceFactory oneMeter / 2 = distanceFactory halfAMeter.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:06:03'!
test09TenKilometersMustBeGreaterThanAMeter
	self assert: distanceFactory tenKilometers > distanceFactory oneMeter.! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:06:59'!
test10OneMeterIsLessThanThreeMeters
	self assert: distanceFactory oneMeter < distanceFactory threeMeters ! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:07:13'!
test11TenKilometersIsGreaterOrEqualThanOneMeter
	self assert: distanceFactory tenKilometers >= distanceFactory oneMeter ! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:07:26'!
test12OneMeterIsLessThanOrEqualToThreeMeters
	self assert: distanceFactory oneMeter <= distanceFactory threeMeters ! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:07:46'!
test13OneMeterToThreeMetersMustEqualAnIntervalFromOneToThree
	self assert: (distanceFactory oneMeter to: distanceFactory threeMeters) = (1 to: 3).! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:08:17'!
test14OneMeterToTenKilometersWithAStepOfFiveCentimetersMustEqualAnIntervalFromOneToTenThousandWithStepsOf05
	self assert: (distanceFactory oneMeter to: distanceFactory tenKilometers by: distanceFactory fiveCentimeters) = (1 to: 10000 by: 5/100).! !

!DistanceTest methodsFor: 'Testing' stamp: 'AS 5/30/2017 09:09:03'!
test15ForOneMeterToTenKilometersByFiveCentimetersItShouldDoATaks
	| counter |
	
	counter := 0.
	self assert: (distanceFactory oneMeter to: distanceFactory tenKilometers by: distanceFactory fiveCentimeters do: [:i | counter := counter + 1 ] ) = (1 to: 10000 by: 5/100 do: [:i | counter := counter + 1 ]).! !


!classDefinition: #Distance category: #'Distance-Solution'!
Object subclass: #Distance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Distance-Solution'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:06:04'!
assertIsPositive: aSize
	aSize <= 0 ifTrue: [ self error: self canNotCreateNegativeOrZeroDistanceErrorMessage ]
! !

!Distance class methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:06:30'!
canNotCreateNegativeOrZeroDistanceErrorMessage
	^'Cannot create a distance with negative or zero size'! !


!classDefinition: #Centimeter category: #'Distance-Solution'!
Distance subclass: #Centimeter
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:29:16'!
* aSize
	^Centimeter withSize: size * aSize.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:12:42'!
+ aDistance
	^aDistance addACentimeter: self.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:12:46'!
- aDistance
	^aDistance subtractToACentimeter: self.! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:12:53'!
= aDistance
	^size = aDistance toCentimeters! !

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

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:50'!
subtractToACentimeter: aCentimeter
	| newMeasure |
	
	newMeasure := aCentimeter size - self size.
	Distance assertIsPositive: newMeasure.
	
	^Centimeter withSize: (newMeasure).! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:54'!
subtractToAMeter: aMeter
	| newMeasure |
	
	newMeasure := aMeter toCentimeters - self size.
	Distance assertIsPositive: newMeasure.
	
	^Centimeter withSize: (newMeasure).! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:58'!
subtractToAMilimeter: aMilimeter
	| newMeasure |
	
	newMeasure := aMilimeter toCentimeters - self size.
	Distance assertIsPositive: newMeasure.
	
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

!Centimeter class methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:08:18'!
withSize: aSize
	Distance assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #Kilometer category: #'Distance-Solution'!
Distance subclass: #Kilometer
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:13:28'!
< aDistance
	^ self size < aDistance toKilometers.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:13:33'!
<= aDistance
	^ (self size < aDistance toKilometers) or: (self size = aDistance toKilometers). ! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:13:38'!
= aDistance
	^size = aDistance toKilometer.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:13:44'!
> aDistance
	^ self size > aDistance toKilometers.! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:13:50'!
>= aDistance
	^ (self size > aDistance toKilometers) or: (self size = aDistance toKilometers). ! !

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

!Kilometer class methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:08:09'!
withSize: aSize
	Distance assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #Meter category: #'Distance-Solution'!
Distance subclass: #Meter
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:29:02'!
* aSize
	^Meter withSize: size * aSize.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:05'!
+ aDistance
	^aDistance addAMeter: self.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:09'!
- aDistance
	^aDistance subtractToAMeter: self.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:47:00'!
/ aNumber
	^Meter withSize: (self size / aNumber).! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:21'!
< aDistance
	^self size < aDistance toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:27'!
<= aDistance
	^ (self size < aDistance toMeters) or: (self size = aDistance toMeters). ! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:31'!
= aDistance
	^size = aDistance toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:35'!
> aDistance
	^self size > aDistance toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:42'!
>= aDistance
	^ (self size > aDistance toMeters) or: (self size = aDistance toMeters). ! !

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

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:09:54'!
subtractToACentimeter: aCentimeter
	| newMeasure |
	
	newMeasure := aCentimeter toMeters - self size.
	Distance assertIsPositive: newMeasure.
	
	^Meter withSize: (newMeasure).! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:16'!
subtractToAMeter: aMeter
	| newMeasure |
	
	newMeasure := aMeter size - self size.
	Distance assertIsPositive: newMeasure.
	
	^Meter withSize: (newMeasure).
! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:23'!
subtractToAMilimeter: aMilimeter
	| newMeasure |
	
	newMeasure := aMilimeter toMeters - self size.
	Distance assertIsPositive: newMeasure.
	
	^Meter withSize: (newMeasure).! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:55'!
to: aDistance
	^(self size) to: (aDistance toMeters) by: 1.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:15:03'!
to: aDistance by: step
	^(self size) to: (aDistance toMeters) by: step toMeters.! !

!Meter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:14:59'!
to: aDistance by: step do: aTask
	^(self size) to: (aDistance toMeters) by: step toMeters do: aTask.! !

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

!Meter class methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:07:53'!
withSize: aSize
	Distance assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #Milimeter category: #'Distance-Solution'!
Distance subclass: #Milimeter
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 19:29:24'!
* aSize
	^Milimeter withSize: size * aSize.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:15:12'!
+ aDistance
	^aDistance addAMilimiter: self.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:15:25'!
- aDistance
	^aDistance subtractToAMilimeter: self.! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:15:31'!
= aDistance
	^size = aDistance toMilimeters! !

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

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:29'!
subtractToACentimeter: aCentimeter
	| newMeasure |
	
	newMeasure := aCentimeter toMilimeters - self size.
	Distance assertIsPositive: newMeasure.
	
	^Milimeter withSize: (newMeasure).! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:37'!
subtractToAMeter: aMeter
	| newMeasure |
	
	newMeasure := aMeter toMilimeters - self size.
	Distance assertIsPositive: newMeasure.
	
	^Milimeter withSize: (newMeasure).! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:11:33'!
subtractToAMilimeter: aMilimeter
	| newMeasure |
	
	newMeasure := aMilimeter size - self size.
	Distance assertIsPositive: newMeasure.
	
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

!Milimeter class methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 14:08:01'!
withSize: aSize
	Distance assertIsPositive: aSize.
	
	^self new initializeWith: aSize! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 09:08:31'!
fiveCentimeters
	^Centimeter withSize: 5.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 09:05:23'!
halfAMeter
	^Meter withSize: 0.5! !

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

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 09:03:27'!
oneThousandMilimeters
	^Milimeter withSize: 1000.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 09:06:15'!
tenKilometers
	^Kilometer withSize: 10.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/30/2017 09:06:42'!
threeMeters
	^Meter withSize: 3.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:25'!
twoHundredCentimeters
	^Centimeter withSize: 200.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:39'!
twoMeters
	^Meter withSize: 2.! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'AS 5/29/2017 20:22:51'!
zeroMeters
	^Meter withSize: 0.! !
