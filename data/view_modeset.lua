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

-- Function to handle start button events
local function helpEvent( event )

    if ( "ended" == event.phase ) then

 	    composer.gotoScene( "view_help")
		
    end
end

-- Function to handle start button events
local function handleButtonSingleEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "view_home") --this is to clear the data in the locations overview
        composer.removeScene( "view_roles") --this is to clear the data in the roles scene
	    composer.gotoScene( "view_home")--, sceneChangeOptions) --transport this data to the next scene
    end
end

-- Function to handle start button events
local function handleButtonTeamEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "view_home_team") --this is to clear the data in the locations overview
        composer.removeScene( "view_roles_team") --this is to clear the data in the roles scene
	    composer.gotoScene( "view_home_team")--, sceneChangeOptions) --transport this data to the next scene
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
	local title = display.newText( "Catch the Mole!", display.contentCenterX, 20, native.systemFont, 40 )
	title:setFillColor( unpack(myRedOld) ) -- change color of text

	-- Draw red line
	local line = display.newRect( display.contentCenterX, 50, 230, 2 )
	line:setFillColor( unpack(myRedOld) )


	local startSingleButton = widget.newButton
	{
	    label = "Normal Game",
	    onEvent = handleButtonSingleEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    shape="roundedRect",
	    width = 200,
	    height = 40,
	    x = display.contentCenterX,
	    y = 200,
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


	local startTeamButton = widget.newButton
	{
	    label = "Team Game",
	    onEvent = handleButtonTeamEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    shape="roundedRect",
	    width = 200,
	    height = 40,
	    x = display.contentCenterX,
	    y = 280,
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

    -- new help button
	local helpButton = widget.newButton
	{
	    label = "?",
	    onEvent = helpEvent,
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
	sceneGroup:insert( startSingleButton )
	sceneGroup:insert( startTeamButton )
	sceneGroup:insert( helpButton )

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