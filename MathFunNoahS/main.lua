-----------------------------------------------------------------------------------------
-- Noah Sabbagh
-- main.lua
-- Math Fun
-- ICS2O
-- This prorgram dispalys a numeric text field and goes through a boolean expression
-- choosing addition, subtraction, multiplication or division. 
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- change the background colour
display.setDefault("background", 95/255, 230/255, 226/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local randomOperator
local randomNumber1
local randomNumber2
local correctAnswer
local questionObject
local numericField

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Function: AskQuestionListener
-- Input: event listener
-- Output: none
-- Description: This funciton accepts an event listener
local function AskQuestion()
	-- generate a random number between 1 and 4
	randomOperator = math.random(1,4)

	-- generate 2 random numbers
	randomNumber1 = math.random(0,4)
	randomNumber2 = math.random(0,4)

	-- if random operator is 1, then do addtion
	if (randomOperator == 1) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
	
	-- however, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		--calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		
		-- but, if the random operator is 3, do multiplication
	elseif (randomOperator == 3) then
		--calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	-- otherwise, if random operator is 4, do division
	elseif (randomOperator == 4) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2

		-- create the question text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
	end
end
 

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- create the question text object
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 75)
questionObject:setTextColor(11/255, 16/255, 189/255)

-- create the numeric field
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight*2/3, 200, 100)
numericField.inputType = "number"

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to askt the question
AskQuestion()
