-----------------------------------------------------------------------------------------
-- Noah Sabbagh
-- main.lua
-- ICS2O
-- This program displays a button which the user can click.
-- Once the button is clicked, the button changes colour
-- and says "Clicked!". There is also a sound that plays
-- once you click on the button
-----------------------------------------------------------------------------------------

-- hide your status bar
display.setStatusBar(display.HiddenStatusBar)

-- change the background colour
display.setDefault ("background", 16/255, 210/255, 68/255)

-- create the blue button and set its position and make
-- it visible
local blueButton = display.newImageRect("Images/blueButton.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create the red button, set its position and make it 
-- invisible
local redButton = display.newImageRect("Images/redButton.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create the text object, set its position and make it
-- invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- create an image that will appear when blue button is clicked
local checkmark = display.newImageRect("Images/checkmark.png", 198, 96)
checkmark.x = display.contentWidth * 3/4
checkmark.y = display.contentHeight * 2
checkmark.isVisible = false

-- create a variable for your sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make
-- the text appear with the red button, and make the blue
-- button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		correctSoundChannel = audio.play(correctSound)
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end 

blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is released, it will go back to the blue button
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = false
		checkmark.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = true
		checkmark.isVisible = false
	end
end

redButton:addEventListener("touch", RedButtonListener)