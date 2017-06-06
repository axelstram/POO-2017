!classDefinition: #MeasureTest category: #'Measure-Solution'!
TestCase subclass: #MeasureTest
	instanceVariableNames: 'zeroMeters oneMeter twoMeters tenMeters twentyMeters oneHundredMeters oneHundredCentimeters zeroDollars oneDollar tenDollars thirtyLiters threeLiters oneLiter'
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

!MeasureTest methodsFor: 'Testing' stamp: 'AS 6/6/2017 20:53:06'!
test09ConvertingMetersToCentimetersWorksCorrectly
	self assert: (oneMeter convertTo: Unit centimeter) = oneHundredCentimeters ! !


!MeasureTest methodsFor: 'setUp' stamp: 'AS 6/6/2017 13:27:49'!
initialize
	zeroDollars := MeasureFactory zeroDollars.
	oneDollar := MeasureFactory oneDollar.
	tenDollars := MeasureFactory tenDollars.
	zeroMeters := MeasureFactory zeroMeters.
	oneMeter := MeasureFactory oneMeter.
	twoMeters := MeasureFactory twoMeters.
	tenMeters := MeasureFactory tenMeters.
	twentyMeters := MeasureFactory twentyMeters.
	oneHundredMeters := MeasureFactory oneHundredMeters.
	oneHundredCentimeters := MeasureFactory oneHundredCentimeters.
	threeLiters := MeasureFactory threeLiters.
	thirtyLiters := MeasureFactory thirtyLiters.
	oneLiter := MeasureFactory oneLiter.! !


!classDefinition: #Measure category: #'Measure-Solution'!
Object subclass: #Measure
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:52:13'!
* aNumber
	| newAmount |
	
	newAmount := self amount * aNumber.
	
	^self class withAmount: (newAmount) andUnit: self unit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 20:07:30'!
+ aMeasure
	| newAmount |
	
	newAmount := (amount * unit ratio) + (aMeasure amount * aMeasure unit ratio).
	
	^self class withAmount: (newAmount) andUnit: self unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:53:07'!
- aMeasure
	| newAmount |
	
	newAmount := self amount * self unit ratio - (aMeasure amount * aMeasure unit ratio).
	
	^self class withAmount: (newAmount) andUnit: self unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:52:47'!
/ aNumber
	| newAmount |
	
	newAmount := self amount / aNumber.
	
	^self class withAmount: (newAmount) andUnit: self unit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 20:19:42'!
= aMeasure
	^((unit type = aMeasure unit type) and: (amount * unit ratio = (aMeasure amount * aMeasure unit ratio))) or: (amount = 0).! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 20:20:26'!
adaptToInteger: anInteger andSend: aSelector
	^Measure withAmount: (anInteger perform: aSelector with: (self amount * self unit ratio)) andUnit: self unit.
	! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/4/2017 00:35:43'!
amount
	^amount ! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:52:27'!
unit
	^unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:51:26'!
withAmount: anAmount  andUnit: aUnit
	amount := anAmount.
	unit := aUnit.! !


!Measure methodsFor: 'conversion' stamp: 'AS 6/6/2017 20:52:07'!
convertTo: anotherType
	| newAmount |
	
	
	newAmount := self amount * (1/anotherType ratio).
	
	^Measure withAmount: newAmount andUnit: (self unit convertTo: anotherType).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Measure-Solution'!
Measure class
	instanceVariableNames: ''!

!Measure class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:51:41'!
withAmount: anAmount andUnit: aUnit
		^self new withAmount: anAmount andUnit: aUnit! !


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

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:53:36'!
oneDollar
	^Measure withAmount: 1 andUnit: Unit dollar ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:53:47'!
oneHundredCentimeters
	^Measure withAmount: 100 andUnit: Unit centimeter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:54:01'!
oneHundredMeters
	^Measure withAmount: 100 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:54:11'!
oneLiter
	^Measure withAmount: 1 andUnit: Unit liter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:54:23'!
oneMeter
	^Measure withAmount: 1 andUnit: Unit meter.! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:54:34'!
sixteenPesos
	^Measure withAmount: 16 andUnit: Unit peso ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:54:44'!
tenDollars
	^Measure withAmount: 10 andUnit: Unit dollar ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:54:57'!
tenMeters
	^Measure withAmount: 10 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:55:06'!
thirtyLiters
	^Measure withAmount: 30 andUnit: Unit liter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:55:20'!
threeLiters
	^Measure withAmount: 3 andUnit: Unit liter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:55:30'!
twentyMeters
	^Measure withAmount: 20 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:55:39'!
twoMeters
	^Measure withAmount: 2 andUnit: Unit meter ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:55:49'!
zeroDollars
	^Measure withAmount: 0 andUnit: Unit dollar ! !

!MeasureFactory class methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:56:02'!
zeroMeters
	^Measure withAmount: 0 andUnit: Unit meter ! !


!classDefinition: #Unit category: #'Measure-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'ratio type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Unit methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 20:50:47'!
convertTo: anotherUnit
	^Unit new withRatio: anotherUnit ratio andType: anotherUnit type! !

!Unit methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 19:49:03'!
ratio
	^ratio ! !

!Unit methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 20:18:30'!
type
	^type ! !

!Unit methodsFor: 'as yet unclassified' stamp: 'AS 6/6/2017 20:18:18'!
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
