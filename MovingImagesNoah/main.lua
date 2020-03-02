-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Noah Sabbagh
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen 
-- and then makes it fade in.
-- I added a second object that moves in a different 
-- direction, fades out and grows in size.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeedBeetleship = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight * 1/5

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip (event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeedBeetleship
	-- change the transparency of the ship every time it fades in
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- create the second character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- make a new scroll speed for the rocketship
scrollSpeedRocketship = -5

-- set the image to be a full image from the start
rocketship.alpha = 1

-- set the initial x and y position of the rocketship
rocketship.x = 1024
rocketship.y = display.contentHeight * 2/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Outout: none
-- Description: This function adds the scroll speed tot he x-value of the ship
local function MoveShip (event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x + scrollSpeedRocketship
	-- change the transparency of the ship so it moves and then fades out
	rocketship.alpha = rocketship.alpha - 0.0000000001
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
