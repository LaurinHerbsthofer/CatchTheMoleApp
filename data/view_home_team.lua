local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" ) --this is for data transfer between the scenes

-- colors
local myBlack={0,0,0,1}
local myWhite={1,1,1,1}
local myBrown={82/255,31/255,6/255,1}
local myLightBrown={124/255,46/255,7/255,1}
local myRed={122/255,0,0,1}
local myLightRed={137/255,52/255,52/255,1}
local myGray={110/255,110/255,110/255,1}
local myLightGray={177/255,177/255,177/255,1}
local myDarkGray={80/255,80/255,80/255,1}
local myRedOld={1, 110/255, 110/255, 1}

local myPurpleOld={ 0.8, 0.8, 1, 1 }
local myGreen={0,122/255,0,1}
local myRedOld=myPurpleOld	

-- Create tables to hold data    
local players = {}
local teams = {}
local locationsetNames = {}
--local playerMsgVec = {} -- stores the messages that are presented to players
--local normalPlayerMsg = "Location: "
--local spyMsg = "You are a SPY!"

--local playerVec = {}
--local numOfLocs = 0
local minPlayerNumber = 3
local maxPlayerNumber = 20
--local locations = {} --this will store the locationset that is actually used

-- ------------ change these location sets if you want but check if the numOfLoc is updated! ------------------------

-- local numOfLocsSet1 = 30 --this is the default locations set (like in spyfall but added: Almhuette and Kindergarten)
-- local locationsSet1 = {	"Almhuette","Autowerkstatt","Bank","Botschaft","Casino","Filmstudio",
-- 						"Firmenparty","Flugzeug","Freibad","Hotel","Kaserne","Kathedrale",
-- 						"Kindergarten","Krankenhaus","Kreuzfahrtschiff","Piratenschiff",
-- 						"Polar-Forschungs-Station","Polizeistation","Raumstation",
-- 						"Restaurant","Schule","Strand","Supermarkt","Tempelritter-Armee",
-- 						"Theater","Therme/Spa","U-Boot","Universitaet","Zirkus","Zug" }

-- local numOfLocsSet2 = 15 --this is the alternate locations set
-- local locationsSet2 = {	"Museum", "Oper", "Metal Konzert", "Bunker", "Chemielabor",
-- 						"Friedhof","Pubquiz","Tupperparty","Boxring","Geldtransporter",
-- 						"Sauna","Boerse","Lift","'Ich hab mich verlaufen!'","Hochzeit" }

-- Populate the "players" and "spies" table
for i = 1, maxPlayerNumber-minPlayerNumber+1 do
    players[i] = i+minPlayerNumber-1
end

for i = 2, 5 do
    teams[i]=i
end
teams[1]="random"
-- populate the locationset
locationsetNames[1]="default"
locationsetNames[2]="alternate"
locationsetNames[3]="def+alt"
locationsetNames[4]="template"

-- Configure the picker wheel columns
local columnData = 
{	-- total width should be 280
    -- Players
    {
        align = "center",
        width = 85, --140 or display.contentWidth/2
        startIndex = 2,
        labels = players
    },
    -- Location set
    {
    	align = "center",
    	width = 110,
    	startIndex = 1,
    	labels = locationsetNames   	
	},
	-- Teams
    {
        align = "center",
        width = 85, --140 or display.contentWidth/2
        startIndex = 2,
        labels = teams
    }
}

-- Image sheet options and declaration
local options = {
    frames = 
    {
        { x=0, y=0, width=320, height=222 },
        { x=320, y=0, width=320, height=222 },
        { x=640, y=0, width=8, height=222 }
    },
    sheetContentWidth = 648,
    sheetContentHeight = 222
}

local pickerWheelSheet = graphics.newImageSheet( "pickerSheet_minimal_gray.png", options )

local pickerWheel


-- Function to handle start button events
local function helpEvent( event )

    if ( "ended" == event.phase ) then
 	    composer.gotoScene( "view_help")
    end
end

-- Function to handle start button events
local function quitEvent( event )
    if ( "ended" == event.phase ) then
 	    composer.gotoScene( "view_modeset")
    end
end

-- Function to handle start button events
local function handleButtonEvent( event )
    local values
    local currentPlayers
    local currentLocSet
    local currentTeams

    if ( "ended" == event.phase ) then

        values = pickerWheel:getValues()
        currentPlayers = tonumber(values[1].value) -- always integer
        currentLocSet = values[2].value --always string
        currentTeams = values[3].value --can be integer or string ("random" or a number)

        --store to mydata.lua to be used in other scenes (this must be done in the same scope as the call to composer.gotoScene( "view_roles") !)
		myData.numOfPlayers= values[1].value 
		myData.locSet=values[2].value
		myData.numOfTeams=values[3].value

        -- no we've got everything from the user input: currentPlayers, currentLocSet & currentSpies
        composer.removeScene( "view_locoverview" ) --this is to clear the data in the locations overview
        composer.removeScene( "view_roles" ) --this is to clear the data in the roles scene
	    composer.gotoScene( "view_roles_team" )--, sceneChangeOptions) --transport this data to the next scene

    end
end
-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- set display background color
	display.setDefault( "background", unpack(myBlack) )

	-- create a text field
	local title = display.newText( "Catch the Team!", display.contentCenterX, 20, native.systemFont, 40 )
	title:setFillColor( unpack(myRedOld) ) -- change color of text

	-- Draw red line
	local line = display.newRect( display.contentCenterX, 50, 230, 2 )
	line:setFillColor( unpack(myRedOld) )

	-- create the text fields for the user input
	local myPlayerTextBox = display.newText( "#Players", display.contentCenterX-110, 110, native.systemFont, 18 )
	myPlayerTextBox:setFillColor( unpack(myRedOld) ) -- change color of text

	local myLocationsetTextBox = display.newText( "LocationSet", display.contentCenterX, 110, native.systemFont, 18 )
	myLocationsetTextBox:setFillColor( unpack(myRedOld) ) -- change color of text

	local mySpyTextBox = display.newText( "#Teams", display.contentCenterX+110, 110, native.systemFont, 18 )
	mySpyTextBox:setFillColor( unpack(myRedOld) ) -- change color of text

	-- Create the widget
	pickerWheel = widget.newPickerWheel
	{
	    x = display.contentCenterX,
	    y = 240,
	    columns = columnData,
	    sheet = pickerWheelSheet,
	    overlayFrame = 1,
	    overlayFrameWidth = 320,
	    overlayFrameHeight = 222,
	    backgroundFrame = 2,
	    backgroundFrameWidth = 320,
	    backgroundFrameHeight = 222,
	    separatorFrame = 3,
	    separatorFrameWidth = 8,
	    separatorFrameHeight = 222,
	    columnColor = {0,0,0,0},
	    backgroundColor = myBlack,
	    fontColor = myDarkGray,	
	    fontColorSelected = myRedOld
	}

	--testtextbox
	--displaytest = display.newText( "Testbox", display.contentCenterX, -20, native.systemFont, 30 )
	--displaytest:setFillColor( 1, 1, 1 ) -- change color of text

	local startButton = widget.newButton
	{
	    label = "START GAME",
	    onEvent = handleButtonEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    shape="roundedRect",
	    width = 200,
	    height = 40,
	    x = display.contentCenterX,
	    y = 400,
	    cornerRadius = 2,	
	    fillColor={default=myGreen,over=myBlack},
	    labelColor={default=myWhite,over=myWhite},
	    strokeColor={default=myWhite,over=myPurpleOld},
	    strokeWidth=2
	   	--[[fillColor = { default=myRed, over=myBlack},
	    labelColor = { default=myWhite, over=myWhite},
	    strokeColor = { default=myWhite, over=myPurpleOld},
	    strokeWidth = 2
	    --]]
	}

    -- new quit button
	local quitButton = widget.newButton
	{
	    label = "X",
	    onEvent = quitEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    --shape="roundedRect",
	    --width = 40,
	    --height = 40,

	    --properties for circle
	    shape="Circle",
	    radius=20,

	    x = display.contentCenterX,
	    y = 460,
	    cornerRadius = 2,
	    fillColor = { default=myRed, over=myBlack},
	    labelColor = { default=myWhite, over=myWhite},
	    strokeColor = { default=myWhite, over=myPurpleOld},
	    strokeWidth = 2
	}

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( title )
	sceneGroup:insert( line )
	sceneGroup:insert( myPlayerTextBox )
	sceneGroup:insert( myLocationsetTextBox )
	sceneGroup:insert( mySpyTextBox )
	sceneGroup:insert( pickerWheel )
	--sceneGroup:insert( displaytest )
	sceneGroup:insert( startButton )
	sceneGroup:insert( quitButton )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------




return scene