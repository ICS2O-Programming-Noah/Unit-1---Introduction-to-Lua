-----------------------------------------------------------------------------------------
-- Title: Whack A Mole
-- main.lua
-- Created by: Noah Sabbagh
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg
local alien
local points = 0
local pointsText

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
bkg:setFillColor(102/255, 159/255, 255)
-- set the position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

-- create the aliens
alien = display.newImage( "Images/alien.png", 0, 0)
-- set the position
alien.x = display.contentCenterX
alien.y = display.contentCenterY
-- scale the image to be 1/3 of its original size
alien:scale(0.3, 0.3)
-- make the alien invisible
alien.alpha = 0

-- add text object for the score
pointsText = display.newText("Points = " .. points, display.contentWidth*3/8, display.contentHeight*1/6, nil, 50)
pointsText:setTextColor(199/255, 41/255, 205/255)
pointsText.isVisible = true

-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------
function PopUp()

	-- Choose a random position on the screen bewteen 0 and the size of the screen
	alien.x = math.random( 0, display.contentWidth)
	alien.y = math.random( 0, display.contentHeight)
	alien.isVisible = true
	Hide()
	timer.performWithDelay(500, Hide)
end

function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

function Hide()
	-- change the visibility of the alien
	alien.isVisible = false
	PopUpDelay()
end

function GameStart()
	PopUpDelay()
end

function Whacked(event)
	-- if touch phase just started
	if (event.phase == "began") then
		points = points + 1
		pointsText.text = "Points = " .. points
	end
end

--------------------------------------- Event Listeners --------------------------------------
-- I add the event listener to the aliens so that if the alien is touched, the Whacked function
-- is called
alien:addEventListener( "touch", Whacked )

---------------------------------------- Start the Game ---------------------------------
GameStart()