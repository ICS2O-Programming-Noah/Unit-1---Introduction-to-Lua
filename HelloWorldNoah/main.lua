-----------------------------------------------------------------------------------------
-- Name: Noah Sabbagh
-- main.lua
-- This program displays "Hello Noah!" to the user.
-----------------------------------------------------------------------------------------

-- Your code here

local textObjectSignature

-- print a greeting to the console
print ("**** Hello Noah!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 16/255, 243/255, 228/255)

-- create a local variable
local textObject

-- displays text on the screen at position x=500 and y=500 with
-- a default font style and font size of 50
textObject = display.newText("Hello, Noah!", 500, 350, nil, 150)

-- sets the color of the text
textObject:setTextColor(151/255, 42/255, 198/255)

-- Displayed signature below Hello Noah.
textObjectSignature = display.newText("Created by Noah Sabbagh", 500, 600, nil, 50)

-- Set the color of the signature text
textObjectSignature:setTextColor(151/255, 42/255, 198/255)