-----------------------------------------------------------------------------------------
-- Noah Sabbagh
-- main.lua
-- This program displays four different polygons on an iPad screen. 
-----------------------------------------------------------------------------------------

-- Your code here

-- Create local variables for the vertices of your shapes.
local verticesTri = { 0, 80, 130, -80, -70, -85 }  
local verticesPent = { 0, 60, 90, 0, 60, -80, 40, -80, -90, 0 }
local verticesHex = { 40, 45, 90, -10, 60, -45, -45, -45, -80, -10, -40, 45 }
local verticesOct = { 20, 40, 30, 20, 30, -20, 20, -40, -20, -40,-40, -20, -40, 20,-20, 40 }
local myTriangle
local myPentagon
local myHexagon
local myOctagon
local areaOfTriangle
local baseTri = 10
local heightOfTri = 12
local areaText
local textSize = 25

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 172/255, 22/255, 22/255)

-- create your first polygon.
myTriangle = display.newPolygon (225, 140, verticesTri)

-- set color of the triangle
myTriangle:setFillColor(0.7, 1, 0.7)  

-- set the border for the triangle
myTriangle:setStrokeColor(0, 1, 0)
myTriangle.strokeWidth = 10

-- calculate the area of the triangle
areaOfTriangle = baseTri * heightOfTri / 2

-- display the text saying the area of the triangle
areaText = display.newText("The area of this triangle with a base of \n" ..
		baseTri .. " and a height of " .. heightOfTri .. " is " ..
		areaOfTriangle .. " pixels².", 225, 260, Arial, textSize)

-- create the next shape
myPentagon = display.newPolygon (800, 150, verticesPent)

-- set color of the pentagon
myPentagon:setFillColor(0.7, 1, 0.7)

-- create the border of the pentagon
myPentagon:setStrokeColor(0. 1, 0)
myPentagon:strokeWidth(0

-- create the 3rd shape
myHexagon = display.newPolygon (225, 500, verticesHex)

-- 
