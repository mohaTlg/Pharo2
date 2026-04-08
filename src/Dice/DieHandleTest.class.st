Class {
	#name : 'DieHandleTest',
	#superclass : 'TestCase',
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'tests' }
DieHandleTest >> testCreationAndAddingIsOK [
	| handle |
	handle := DieHandle new 
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	self assert: handle diceNumber equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testCreationWithTheSameDie [
	| handle |
	handle := DieHandle new addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 2.
]

{ #category : 'tests' }
DieHandleTest >> testMaxValue [
	| handle |
	handle := DieHandle new addDie: (Die withFaces: 6).
	handle addDie: (Die withFaces: 10).
	self assert: handle maxValue equals: 16.
]

{ #category : 'tests' }
DieHandleTest >> testRoll [
	| handle |
	handle := DieHandle new addDie: (Die withFaces: 6).
	handle addDie: (Die withFaces: 10).
	self assert: (handle roll between: handle diceNumber and: handle maxValue)
]
