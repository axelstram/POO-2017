!classDefinition: #MeasureTest category: #'Measure-Solution'!
TestCase subclass: #MeasureTest
	instanceVariableNames: 'zeroMeters oneMeter twoMeters tenMeters twentyMeters oneHundredMeters oneHundredCentimeters zeroDollars oneDollar tenDollars sixteenPesos thirtyLiters threeLiters oneLiter tenMetersPerSecond tenMetersPerSecondSquared oneSecond'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/4/2017 00:38:10'!
test01OneMeterPlusOneMeterShouldEqualTwoMeters
	self assert: oneMeter = oneMeter ! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/4/2017 00:48:12'!
test02OneMeterIsNotEqualToOneDollar
	self assert: (oneMeter = oneDollar) = false ! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/4/2017 00:54:31'!
test03ZeroMetersIsEqualToZeroDollars
	self assert: zeroMeters = zeroDollars ! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/4/2017 02:14:21'!
test04OneMeterPlusOneMeterEqualsTwoMeters
	self assert: oneMeter + oneMeter = twoMeters ! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/4/2017 02:16:24'!
test05OneMeterPlusOneHundredCentimetersEqualsTwoMeters
	^self assert: oneMeter + oneHundredCentimeters = twoMeters ! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/6/2017 13:10:33'!
test06OneMeterTimesOneHundredEqualsOneHundredMeters
	self assert: ((oneMeter * 100 = oneHundredMeters) and: (100 * oneMeter = oneHundredMeters)).! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/6/2017 20:22:46'!
test07ThirtyLitersDividedByTenIsEqualToTenLiters
	self assert: ((thirtyLiters / 10) = threeLiters and: ((30 * oneLiter / 10) = threeLiters)).! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/6/2017 13:33:24'!
test08TwentyMetersPlusTenDollarsEqualsItself
	self assert: (tenMeters + tenMeters + tenDollars) = (twentyMeters + tenDollars)! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/7/2017 11:18:25'!
test09ConvertingToUnitsOfTheSameTypeWorksCorrectly
	self assert: (((oneMeter convertTo: Unit centimeter) = oneHundredCentimeters) and: ((oneDollar convertTo: Unit peso) = sixteenPesos)).! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/7/2017 12:48:44'!
test10ConvertingToUnitsOfOtherTypesThrowsAnError
	[oneMeter convertTo: Unit dollar]
	on: Error
	do: [:anError | self assert: anError messageText equals: Measure canNotConvertNumberErrorMessage].! !

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/7/2017 15:32:05'!
test11MultiplyingACompoundUnitByACompatibleSimpleUnitGivesBackASimpleUnit
	self assert: tenMetersPerSecondSquared * oneSecond = tenMetersPerSecond.! !


!MeasureTest methodsFor: 'setUp' stamp: 'AS 6/7/2017 14:55:07'!
initialize
	zeroDollars := MeasureFactory zeroDollars.
	oneDollar := MeasureFactory oneDollar.
	tenDollars := MeasureFactory tenDollars.
	sixteenPesos := MeasureFactory sixteenPesos.
	zeroMeters := MeasureFactory zeroMeters.
	oneMeter := MeasureFactory oneMeter.
	twoMeters := MeasureFactory twoMeters.
	tenMeters := MeasureFactory tenMeters.
	twentyMeters := MeasureFactory twentyMeters.
	oneHundredMeters := MeasureFactory oneHundredMeters.
	oneHundredCentimeters := MeasureFactory oneHundredCentimeters.
	threeLiters := MeasureFactory threeLiters.
	thirtyLiters := MeasureFactory thirtyLiters.
	oneLiter := MeasureFactory oneLiter.
	oneSecond := MeasureFactory oneSecond.
	tenMetersPerSecond := MeasureFactory tenMetersPerSecond.
	tenMetersPerSecondSquared := MeasureFactory tenMetersPerSecondSquared.! !


!classDefinition: #Measure category: #'Measure-Solution'!
Object subclass: #Measure
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Measure methodsFor: 'arithmetic' stamp: 'AS 6/7/2017 16:22:59'!
* aNumber
	| newAmount newUnit |
	
	newAmount := self amount * aNumber.
	newUnit := self unit.
	
	((self unit isKindOf: CompoundUnit) and: (aNumber isKindOf: Measure)) ifTrue: [newUnit := self unit * aNumber unit.
																									 newAmount := self amount * aNumber amount].
	
	^Measure withAmount: newAmount andUnit: newUnit.! !

!Measure methodsFor: 'arithmetic' stamp: 'AS 6/6/2017 20:07:30'!
+ aMeasure
	| newAmount |
	
	newAmount := (amount * unit ratio) + (aMeasure amount * aMeasure unit ratio).
	
	^self class withAmount: (newAmount) andUnit: self unit! !

!Measure methodsFor: 'arithmetic' stamp: 'AS 6/6/2017 19:53:07'!
- aMeasure
	| newAmount |
	
	newAmount := self amount * self unit ratio - (aMeasure amount * aMeasure unit ratio).
	
	^self class withAmount: (newAmount) andUnit: self unit! !

!Measure methodsFor: 'arithmetic' stamp: 'AS 6/6/2017 19:52:47'!
/ aNumber
	| newAmount |
	
	newAmount := self amount / aNumber.
	
	^self class withAmount: (newAmount) andUnit: self unit.! !

!Measure methodsFor: 'arithmetic' stamp: 'AS 6/6/2017 20:20:26'!
adaptToInteger: anInteger andSend: aSelector
	^Measure withAmount: (anInteger perform: aSelector with: (self amount * self unit ratio)) andUnit: self unit.
	! !


!Measure methodsFor: 'conversion' stamp: 'AS 6/7/2017 12:44:08'!
convertTo: anotherUnit
	| newAmount |
	
	(unit type = anotherUnit type) ifFalse: [self error: Measure canNotConvertNumberErrorMessage].

	newAmount := self amount * (1/anotherUnit ratio).
	
	^Measure withAmount: newAmount andUnit: anotherUnit.

	! !


!Measure methodsFor: 'comparison' stamp: 'AS 6/7/2017 16:08:52'!
= aMeasure
	^((unit = aMeasure unit) and: (amount * unit ratio = (aMeasure amount * aMeasure unit ratio))) or: (amount = 0).! !


!Measure methodsFor: 'setUp' stamp: 'AS 6/6/2017 19:51:26'!
withAmount: anAmount  andUnit: aUnit
	amount := anAmount.
	unit := aUnit.! !


!Measure methodsFor: 'info' stamp: 'AS 6/4/2017 00:35:43'!
amount
	^amount ! !

!Measure methodsFor: 'info' stamp: 'AS 6/6/2017 19:52:27'!
unit
	^unit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Measure-Solution'!
Measure class
	instanceVariableNames: ''!

!Measure class methodsFor: 'setUp' stamp: 'AS 6/6/2017 19:51:41'!
withAmount: anAmount andUnit: aUnit
		^self new withAmount: anAmount andUnit: aUnit! !


!Measure class methodsFor: 'error' stamp: 'AS 6/7/2017 12:49:40'!
canNotConvertNumberErrorMessage
	^'Cannot convert to unit of another type'! !


!classDefinition: #MeasureFactory category: #'Measure-Solution'!
Object subclass: #MeasureFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MeasureFactory class' category: #'Measure-Solution'!
MeasureFactory class
	instanceVariableNames: ''!

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:53:36'!
oneDollar
	^Measure withAmount: 1 andUnit: Unit dollar ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:53:47'!
oneHundredCentimeters
	^Measure withAmount: 100 andUnit: Unit centimeter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:54:01'!
oneHundredMeters
	^Measure withAmount: 100 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:54:11'!
oneLiter
	^Measure withAmount: 1 andUnit: Unit liter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:54:23'!
oneMeter
	^Measure withAmount: 1 andUnit: Unit meter.! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/7/2017 14:54:04'!
oneSecond
	^Measure withAmount: 1 andUnit: Unit second
! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:54:34'!
sixteenPesos
	^Measure withAmount: 16 andUnit: Unit peso ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:54:44'!
tenDollars
	^Measure withAmount: 10 andUnit: Unit dollar ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:54:57'!
tenMeters
	^Measure withAmount: 10 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:55:06'!
thirtyLiters
	^Measure withAmount: 30 andUnit: Unit liter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:55:20'!
threeLiters
	^Measure withAmount: 3 andUnit: Unit liter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:55:30'!
twentyMeters
	^Measure withAmount: 20 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:55:39'!
twoMeters
	^Measure withAmount: 2 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:55:49'!
zeroDollars
	^Measure withAmount: 0 andUnit: Unit dollar ! !

!MeasureFactory class methodsFor: 'simple' stamp: 'AS 6/6/2017 19:56:02'!
zeroMeters
	^Measure withAmount: 0 andUnit: Unit meter ! !


!MeasureFactory class methodsFor: 'compound' stamp: 'AS 6/7/2017 14:44:39'!
tenMetersPerSecond
	^Measure withAmount: 10 andUnit: CompoundUnit metersPerSecond ! !

!MeasureFactory class methodsFor: 'compound' stamp: 'AS 6/7/2017 14:48:34'!
tenMetersPerSecondSquared
	^Measure withAmount: 10 andUnit: CompoundUnit metersPerSecondSquared ! !


!classDefinition: #Unit category: #'Measure-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'ratio type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Unit methodsFor: 'comparison' stamp: 'AS 6/7/2017 14:26:02'!
= anotherUnit
	^(ratio = anotherUnit ratio) and: (type = anotherUnit type).! !


!Unit methodsFor: 'info' stamp: 'AS 6/6/2017 19:49:03'!
ratio
	^ratio ! !

!Unit methodsFor: 'info' stamp: 'AS 6/6/2017 20:18:30'!
type
	^type ! !


!Unit methodsFor: 'setUp' stamp: 'AS 6/6/2017 20:18:18'!
withRatio: aRatio andType: aType
	ratio := aRatio.
	type := aType! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Unit class' category: #'Measure-Solution'!
Unit class
	instanceVariableNames: ''!

!Unit class methodsFor: 'distance' stamp: 'AS 6/6/2017 20:26:24'!
centimeter
	^Unit new withRatio: 1/100 andType: 'distance'! !

!Unit class methodsFor: 'distance' stamp: 'AS 6/6/2017 20:26:30'!
kilometer
	^Unit new withRatio: 1000 andType: 'distance'! !

!Unit class methodsFor: 'distance' stamp: 'AS 6/6/2017 20:26:33'!
meter
	^Unit new withRatio: 1 andType: 'distance'! !

!Unit class methodsFor: 'distance' stamp: 'AS 6/6/2017 20:26:36'!
milimeter
	^Unit new withRatio: 1/1000 andType: 'distance'! !


!Unit class methodsFor: 'currency' stamp: 'AS 6/6/2017 20:26:42'!
dollar
	^Unit new withRatio: 1 andType: 'currency'! !

!Unit class methodsFor: 'currency' stamp: 'AS 6/6/2017 20:26:45'!
peso
	^Unit new withRatio: 1/16 andType: 'currency'! !


!Unit class methodsFor: 'volume' stamp: 'AS 6/6/2017 20:26:49'!
liter
	^Unit new withRatio: 1 andType: 'volume'! !


!Unit class methodsFor: 'time' stamp: 'AS 6/7/2017 13:58:56'!
hour
	^Unit new withRatio: 1 andType: 'time'.! !

!Unit class methodsFor: 'time' stamp: 'AS 6/7/2017 13:58:45'!
minute
	^Unit new withRatio: 1 andType: 'time'.! !

!Unit class methodsFor: 'time' stamp: 'AS 6/7/2017 13:58:50'!
second
	^Unit new withRatio: 1 andType: 'time'.! !

!Unit class methodsFor: 'time' stamp: 'AS 6/7/2017 13:58:13'!
secondsSquared
	^Unit new withRatio: 1 andType: 'timeSquared'.! !


!classDefinition: #CompoundUnit category: #'Measure-Solution'!
Unit subclass: #CompoundUnit
	instanceVariableNames: 'over'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!CompoundUnit methodsFor: 'setUp' stamp: 'AS 6/7/2017 13:56:31'!
withRatio: aRatio andType: aType over: secondType
	ratio := aRatio.
	type := aType.
	over := secondType.! !


!CompoundUnit methodsFor: 'arithmetic' stamp: 'AS 6/7/2017 16:07:42'!
* anotherUnit
	((over type beginsWith: anotherUnit type) and: (over type endsWith: 'Squared')) ifTrue: 
				[^CompoundUnit new withRatio: ratio andType: type over: anotherUnit type].
				
	(over type = anotherUnit type) ifTrue: [^Unit new withRatio: ratio andType: type].! !


!CompoundUnit methodsFor: 'info' stamp: 'AS 6/7/2017 15:38:38'!
over
	^over! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CompoundUnit class' category: #'Measure-Solution'!
CompoundUnit class
	instanceVariableNames: ''!

!CompoundUnit class methodsFor: 'as yet unclassified' stamp: 'AS 6/7/2017 14:39:39'!
metersPerSecond
	^CompoundUnit new withRatio: 1 andType: Unit meter over: Unit second.! !

!CompoundUnit class methodsFor: 'as yet unclassified' stamp: 'AS 6/7/2017 14:47:38'!
metersPerSecondSquared
	^CompoundUnit new withRatio: 1 andType: Unit meter over: Unit secondsSquared.! !
