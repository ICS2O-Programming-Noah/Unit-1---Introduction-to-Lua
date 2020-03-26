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
local incorrectObject
local correctObject
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/incorrectSound.mp3")
local incorrectSoundChannel
local backgroundMusic = audio.loadSound("Sounds/backgroundMusic.mp3")
local backgroundMusicChannel

-----------------------------------------------------------------------------------------
-- ADDING SOUND
-----------------------------------------------------------------------------------------

backgroundMusicChannel = audio.play(backgroundMusic)

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
        
        if (randomNumber2 > randomNumber1) then
        
        -- calculate answer with numbers flipped
        correctAnswer = randomNumber2 - randomNumber1

        -- create question in text object
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
        else 
	    -- calculate the correct answer
	    correctAnswer = randomNumber1 - randomNumber2

	    -- create question in text object
        questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
       end
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
 
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

-- Function: NumericFieldListener
-- Input: event listener
-- Ouput: none
-- Description: This function accepts an event listener 
local function NumericFieldListener (event)
	-- User begins editing the numeric field
	if ( event.phase == "began" ) then
		
		-- clear the text field
		event.target.text = ""

	elseif ( event.phase == "submitted" ) then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			HideCorrect()
			timer.performWithDelay(2000, HideCorrect)	
			-- clear the text field
			event.target.text = ""
			correctSoundChannel = audio.play(correctSound)
			AskQuestion()
		
		else 
			incorrectObject.text = "Sorry! That's incorrect.\nThe correct answer is \n".. correctAnswer
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			HideIncorrect()
			timer.performWithDelay(2000, HideIncorrect)
			-- clear the text field
			event.target.text = ""
			incorrectSoundChannel = audio.play(incorrectSound)
			AskQuestion()
		end
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
numericField.inputType = "decimal"

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth*1/4, display.contentHeight*1/6, nil, 50 )
correctObject:setTextColor(199/255, 41/255, 205/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "", display.contentWidth*4/5, display.contentHeight*1/2, nil, 40 )
incorrectObject:setTextColor(2/255, 60/255, 219/255)
incorrectObject.isVisible = false

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

-- create the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)
