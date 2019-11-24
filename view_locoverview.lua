-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" ) --this is for data transfere between the scenes

local locstext = myData.locsScrollText

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

-- Function to handle start button events
local function quitEvent( event )

    if ( "ended" == event.phase ) then
 	    composer.gotoScene( "view_modeset")
		
    end
end

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a text field
	local title = display.newText( "Location Overview", display.contentCenterX, 20, native.systemFont, 35 )
	title:setFillColor( unpack(myPurpleOld) ) -- change color of text

	-- Draw red line
	local line = display.newRect( display.contentCenterX, 50, 230, 2 )
	line:setFillColor( unpack(myPurpleOld) )
	
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



	-- scrollview!
	local paragraphs = {}
	local paragraph = {}
	local tmpString = locstext

	--[[ Create image sheet for custom scroll bar
	local scrollBarOpt = {
	    width = 20,
	    height = 20,
	    numFrames = 3,
	    sheetContentWidth = 20,
	    sheetContentHeight = 60
	}
	local scrollBarSheet = graphics.newImageSheet( "scrollBar.png", scrollBarOpt )
	--]]
	local scrollView = widget.newScrollView
	{
	    top = 60,
	    left = 0,
	    width = display.contentWidth, --300, 
	    height = 360, --display.contentHeight*3/4,
	    scrollWidth = display.contentWidth,
	    scrollHeight = 8000, --8000
	    backgroundColor = myBlack,
	    horizontalScrollDisabled = true,
	    --[[scrollBarOptions = {
        	sheet = scrollBarSheet,
        	topFrame = 1,
        	middleFrame = 2,
        	bottomFrame = 3
    	}--]]
	}

	local options = {
	    text = "",
	    width = display.contentWidth-30,
	    font = "HelveticaNeue",
	    fontSize = 22,
	    align = "left",
	    fontColor=myWhite
	}

	local yOffset = 10

	repeat
	    paragraph, tmpString = string.match( tmpString, "([^\n]*)\n(.*)" )
	    options.text = paragraph
	    paragraphs[#paragraphs+1] = display.newText( options )
	    paragraphs[#paragraphs].anchorX = 0
	    paragraphs[#paragraphs].anchorY = 0
	    paragraphs[#paragraphs].x = 10
	    paragraphs[#paragraphs].y = yOffset
	    paragraphs[#paragraphs]:setFillColor( unpack(myWhite) )
	    scrollView:insert( paragraphs[#paragraphs] )
	    yOffset = yOffset + paragraphs[#paragraphs].height
	    print( #paragraphs, paragraph )
	until tmpString == nil or string.len( tmpString ) == 0
	-- end scroll view


	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( title )
	sceneGroup:insert( line )
	sceneGroup:insert( scrollView )
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

	--print("this is data transfer:")
	--print(myData.locsScrollText)

	--locstext=myData.locsScrollText
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