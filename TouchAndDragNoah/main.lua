-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Noah Sabbagh
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create local variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local pinkGirl = display.newImageRect("Images/pinkGirl.png", 150, 150)
local pinkGirlWidth = pinkGirl.width
local pinkGirlHeight = pinkGirl.height

local yellowGirl = display.newImageRect("Images/yellowGirl.png", 150, 150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedBlueGirl = false
local alreadyTouchedPinkGirl = false
local alreadyTouchedYellowGirl = false

-- set the inital x and y position of myImage
blueGirl.x = 400
blueGirl.y = 500 

pinkGirl.x = 300
pinkGirl.y = 200

yellowGirl.x = 700
yellowGirl.y = 300

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedPinkGirl == false) and (alreadyTouchedYellowGirl == false) then
			alreadyTouchedBlueGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedPinkGirl = false
		alreadyTouchedYellowGirl = false
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

-- Function: PinkGirlListener
-- Input: touch listener
-- Output: none
-- Description: when pink girl is touched, move her
local function PinkGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedYellowGirl == false) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPinkGirl == true) ) then 
		pinkGirl.x = touch.x
		pinkGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedYellowGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective listeners to each object
pinkGirl:addEventListener("touch", PinkGirlListener)

-- Function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when yellow girl is touched, move her
local function YellowGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedPinkGirl == false) then
			alreadyTouchedYellowGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		yellowGirl.x = touch.x
		yellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedPinkGirl = false
		alreadyTouchedYellowGirl = false
	end
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", YellowGirlListener)