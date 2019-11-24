-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local myBlack={0,0,0,1}
local myWhite={1,1,1,1}
local myBrown={82/255,31/255,6/255,1}
local myLightBrown={124/255,46/255,7/255,1}
local myRed={122/255,0,0,1}
local myLightRed={137/255,52/255,52/255,1}
local myGray={110/255,110/255,110/255,1}
local myLightGray={177/255,177/255,177/255,1}
--local myRedOld={1, 110/255, 110/255, 1}
local myRedOld={122/255,0,0,1}
local myPurpleOld={ 0.8, 0.8, 1, 1 }
local myGreen={0,122/255,0,1}

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myData = require( "mydata" ) --this is for data transfere between the scenes

local normalPlayerMsg = "Location:"
local spyMsg = "Du bist der SPION!"
local spyMsgEng = "You are the SPY!"
local locstext

local playerMsgVec = {}
local playerMsgVecEng = {}
local playerVec = {}
local teamLocationsVec = {}

local locations = {} --this will store the locationset that is actually used
local locationsEng={}
local numOfLocs = 0
local teamId = 0


--[[
local numOfLocsSet1 = 30 --this is the default locations set (like in spyfall but added: Almhuette and Kindergarten)
local locationsSet1 = {"Almhuette","Autowerkstatt","Bank","Botschaft","Casino","Filmstudio",
						"Firmenparty","Flugzeug","Freibad","Hotel","Kaserne","Kathedrale",
						"Kindergarten","Krankenhaus","Kreuzfahrtschiff","Piratenschiff",
						"Polar-Forschungs-Station","Polizeistation","Raumstation",
						"Restaurant","Schule","Strand","Supermarkt","Tempelritter-Armee",
						"Theater","Therme/Spa","U-Boot","Universitaet","Zirkus","Zug" }
local locationsSet1Eng = {	"Alpine Cabin","Car Workshop","Bank","Embassy","Casino","Film Studio",
						"Corporate Party","Airplane","Public Swimming Pool","Hotel","Military Barracks","Kathedral",
						"Kindergarten","Hospital","Cruise Ship","Pirate Ship",
						"Polar Station","Police Station","Space Station",
						"Restaurant","School","Beach","Supermarket","Templar Army",
						"Theater","Spa","Submarine","University","Circus","Train" }

local numOfLocsSet2 = 24 --this is the alternate locations set
local locationsSet2 = { "Museum", "Oper", "Metal Konzert", "Bunker",  "Chemielabor",
						"Friedhof","Pubquiz","Tupperparty","Boxring","Geldtransporter",
						"Sauna","Boerse","Lift","'Ich hab mich verlaufen!'","Hochzeit",
						"Hogwarts", "Speed Dating", "Molkerei", "Aquarium", "Handtasche",
						"Friseur", "Fußpflege", "Kochshow", "Matrix" }
local locationsSet2Eng = {	"Museum", "Opera", "Metal Concert", "Bunker", "Chemistry Laboratory",
						"Cemetry","Pubquiz","Tupper Party","Boxing Ring","Money Transporter",
						"Sauna","Stock Market","Elevator","'I am lost!'","Wedding",
						"Hogwarts", "Speed Dating", "Creamary/Diary", "Aquarium", "Handbag",
						"Hairdresser", "Foot Care", "Cooking TV Show", "Matrix"}
]]

--load data from myData
local numOfLocsSet1 = myData.numOfLocsSet1
local locationsSet1 = myData.locationsSet1
local locationsSet1Eng = myData.locationsSet1Eng
local numOfLocsSet2 = myData.numOfLocsSet2
local locationsSet2 = myData.locationsSet2
local locationsSet2Eng = myData.locationsSet2Eng
local numOfLocsSet3 = myData.numOfLocsSet3
local locationsSet3 = myData.locationsSet3
local locationsSet3Eng = myData.locationsSet3Eng


local showRoleButton
local hideRoleButton
local showLocOverviewButton
local roleTextBox
local roleAssignmentPlayerCount = 1

-- Function to handle start button events
local function quitEvent( event )

    if ( "ended" == event.phase ) then
 	    composer.gotoScene("view_modeset")
		
    end
end

-- Function to handle start button events
local function showLocOverviewEvent( event )

    if ( "ended" == event.phase ) then
 	    composer.gotoScene("view_locoverview")
    end
end


local function showRoleEvent( event )

	if ( "ended" == event.phase ) then
		roleTextBox.text = playerMsgVec[roleAssignmentPlayerCount]
		roleTextBoxEng.text = playerMsgVecEng[roleAssignmentPlayerCount]
		hideRoleButton.alpha=1
		showRoleButton.alpha=0
	end
end

local function hideRoleEvent( event )

	if ( "ended" == event.phase ) then
		roleAssignmentPlayerCount=roleAssignmentPlayerCount+1
		roleTextBox.text = "Player "..tostring(roleAssignmentPlayerCount)
		roleTextBoxEng.text = ""
		hideRoleButton.alpha=0
		showRoleButton.alpha=1
		
		if roleAssignmentPlayerCount == myData.numOfPlayers+1 then
			local startplayeridx = math.random(1, currentPlayers)
			--roleTextBox.text = "You can start\nthe game now!"
			roleTextBox.text = "Player "..tostring(startplayeridx).."\n".."starts the game!"
			roleTextBoxEng.text = ""
			showRoleButton.alpha=0
			showLocOverviewButton.alpha=1
			myData.possibleLocs=locations
			myData.possibleLocsEng=locationsEng
		end
	end
end


function scene:create( event )
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

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



	--testtextbox
	--displaytest = display.newText( "Testbox", display.contentCenterX, 90, native.systemFont, 30 )
	--displaytest:setFillColor( 1, 1, 1 ) -- change color of text

	-- create a text field
	local title = display.newText( "Get your roles", display.contentCenterX, 20, native.systemFont, 40 )
	title:setFillColor( unpack(myPurpleOld) ) -- change color of text

	-- Draw red line
	local line = display.newRect( display.contentCenterX, 50, 230, 2 )
	line:setFillColor( unpack(myPurpleOld) )


	--set up the role show mechanics

	showRoleButton = widget.newButton
	{
	    label = "Show my role",
	    onEvent = showRoleEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    shape="roundedRect",
	    width = 200,
	    height = 40,
	    x = display.contentCenterX,
	    y = 250,
	    cornerRadius = 2,
	    fillColor = { default=myGreen, over=myBlack},
	    labelColor = { default=myWhite, over=myWhite},
	    strokeColor = { default=myWhite, over=myPurpleOld},
	    strokeWidth = 2,
	}

	hideRoleButton = widget.newButton
	{
	    label = "OK",
	    onEvent = hideRoleEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    --shape="roundedRect",
	    --width = 200,
	    --height = 40,
	    --cornerRadius = 2,
	    --width = 20,
	    --height = 20,

	    --properties for circle
	    shape="Circle",
	    radius=25,

	    x = display.contentCenterX,
	    y = 300,
	    fillColor = { default=myGreen, over=myBlack},
	    labelColor = { default=myWhite, over=myWhite},
	    strokeColor = { default=myWhite, over=myPurpleOld},
	    strokeWidth = 2
	}

	showLocOverviewButton = widget.newButton
	{
	    label = "Location Overview",
	    onEvent = showLocOverviewEvent,
	    emboss = false,
	    --properties for a rounded rectangle button...
	    shape="roundedRect",
	    width = 200,
	    height = 40,
	    x = display.contentCenterX,
	    y = 300,
	    cornerRadius = 2,
	    fillColor = { default=myGreen, over=myBlack },
	    labelColor = { default=myWhite, over=myWhite },
	    strokeColor = { default=myWhite, over=myPurpleOld },
	    strokeWidth = 2
	}
	showLocOverviewButton.alpha=0

	--hideRoleButton.alpha=0 --hide this button initially

	--roleTextBox = display.newText( "Player 1", display.contentCenterX, 180, native.systemFont, 30)
	--roleTextBox.align = "center"
	--roleTextBox:setFillColor( 1, 1, 1 ) -- change color of text
	--testtextbox

	local roleTextOptions={
		text="Player 1",
		x=display.contentCenterX,
		y=160,
		font=native.systemFont,
		fontSize=30,
		width=display.contentWidth,
		align="center",
	}

	roleTextBox = display.newText(roleTextOptions)
	roleTextBox:setFillColor( 1, 1, 1 )
	
	roleTextBoxEng = display.newText(roleTextOptions)
	roleTextBoxEng:setFillColor( 1, 1, 1 )
	roleTextBoxEng.text=""
	roleTextBoxEng.y=220

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( title )
	sceneGroup:insert( line )
	--sceneGroup:insert( displaytest )
	sceneGroup:insert( quitButton )
	sceneGroup:insert( showRoleButton )
	sceneGroup:insert( roleTextBox )
	sceneGroup:insert( roleTextBoxEng )
	sceneGroup:insert( hideRoleButton )
	sceneGroup:insert( showLocOverviewButton )

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

	--fix the display for a new game
	hideRoleButton.alpha=0 --hide this button initially
	showRoleButton.alpha=1
	showLocOverviewButton.alpha=0
	roleTextBox.text = "Player 1"
	roleAssignmentPlayerCount = 1

	--get current data
	currentPlayers=tonumber(myData.numOfPlayers)
	currentLocSet=tostring(myData.locSet)
    if myData.numOfTeams == "random" then
    	currentTeams = math.random(1, currentPlayers) --shouldnt this be random(1,currentPlayers) ???
    else
       	currentTeams = tonumber(myData.numOfTeams)
    end

    --print something to console
    --print("")
	--print("this is event SHOW XXXXXXXXXXXXXXXXX")
	--print("players: "..tostring(currentPlayers))
	--print("spies: "..tostring(currentSpies))
	--print("locset: "..tostring(currentLocSet))


	--do the necessary operations--------------------------------------
	-- 
	if (currentTeams >= currentPlayers) then
		currentTeams = currentPlayers
		--displaytest.text="All Spies!"
	else
		--displaytest.text=tostring(currentPlayers-currentSpies).." Players vs. "..tostring(currentSpies).." Spies"
	end

	-- set location vector
	local totnumofLocs
	if (currentLocSet == "default") then
    	locations=locationsSet1
    	locationsEng=locationsSet1Eng
    	numOfLocs=numOfLocsSet1
    elseif (currentLocSet == "alternate") then
    	locations=locationsSet2
    	locationsEng=locationsSet2Eng
    	numOfLocs=numOfLocsSet2
    elseif (currentLocSet == "def+alt") then
    	locations=locationsSet1
    	locationsEng=locationsSet1Eng
    	numOfLocs=numOfLocsSet1+numOfLocsSet2
    	for i=1,numOfLocsSet2 do
    		locations[numOfLocsSet1+i]=locationsSet2[i]
    		locationsEng[numOfLocsSet1+i]=locationsSet2Eng[i]
    	end
    elseif (currentLocSet == "template") then
    	locations=locationsSet3
    	locationsEng=locationsSet3Eng
    	numOfLocs=numOfLocsSet3
    end


    --create the scrollable locations text
    locstext="\nMoegliche Locations:\n(Possible locations)\n\n"
    for i=1, numOfLocs do
    	locstext=locstext..tostring(i)..": "..locations[i].." ("..locationsEng[i]..")\n"
    end
    locstext=locstext.."\n\n"
	myData.locsScrollText=locstext

	--[[create and fill random location
	local randomLoc=math.random(1, numOfLocs) --added a local prefix here
	for i = 1, currentPlayers do
		playerVec[i]=randomLoc
		playerMsgVec[i]=locations[randomLoc]
		playerMsgVecEng[i]=locationsEng[randomLoc]
	end
	
	--create and add random spies
	for i = 1, currentSpies do
		local success = 0
		while success == 0 do
			randomSpy=math.random(1,currentPlayers)
			if playerVec[randomSpy] ~= 0 then
				playerVec[randomSpy]=0
				playerMsgVec[randomSpy]=spyMsg
				playerMsgVecEng[randomSpy]=spyMsgEng
				success = 1
			end
		end
	end
	--]]

	--fill player vec with zeros for convenience
	for i = 1, currentPlayers do
		playerVec[i] = 0
	end

	--fill the playervector with team id's
	teamId = 1
	local setRandomPlayer = 0
	for i = 1, currentPlayers do
		setRandomPlayer = 0
		while setRandomPlayer == 0 do
			setRandomPlayer = math.random(1,currentPlayers)
			if playerVec[setRandomPlayer] > 0 then --if this player was already assigned a team
				setRandomPlayer = 0
			end
		end
		playerVec[setRandomPlayer] = teamId
		teamId = teamId + 1
		if teamId > currentTeams then
			teamId = 1  --start team cycling again from 1
		end
	end

	--create random numbers for locations for each team
	for i = 1, currentTeams do
		local LocOk = 0
		while LocOk == 0 do
			teamLocationsVec[i] = math.random( 1,  numOfLocs)
			LocOk = 1 --assume location wasnt used
			for j = 1, i-1 do --make sure we didnt use this location already
				if teamLocationsVec[j] == teamLocationsVec[i] then
					LocOk = 0
				end
			end
		end
	end

	--transform playerVec to not contain team id's but the location id
	--print('---player locations---')
	for i = 1, currentPlayers do
		local curTeamId = playerVec[i]
		local locationId = teamLocationsVec[curTeamId]
		playerVec[i] = locationId
		playerMsgVec[i] = locations[locationId]
		playerMsgVecEng[i] = locationsEng[locationId]
		--print(playerMsgVec[i])
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