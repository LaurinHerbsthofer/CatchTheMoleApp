-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
local myData = require( "mydata" ) --this is for data transfere between the scenes




-- set the possible location sets here
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

local numOfLocsSet2 = 30 --this is the alternate locations set
local locationsSet2 = { "Museum", "Oper", "Metal Konzert", "Bunker",  "Chemielabor",
						"Friedhof","Pubquiz","Tupperparty","Boxring","Geldtransporter",
						"Sauna","Boerse","Lift","'Ich hab mich verlaufen!'","Hochzeit",
						"Hogwarts", "Speed Dating", "Molkerei", "Aquarium", "Handtasche",
						"Friseur", "Fußpflege", "Kochshow", "Matrix", "WG-Kueche", "White House",
						"Fußballtor", "Fitnesscenter","Spitze des Eiffelturms", "Sponsionsfeier" }
local locationsSet2Eng = {	"Museum", "Opera", "Metal Concert", "Bunker", "Chemistry Laboratory",
						"Cemetry","Pubquiz","Tupper Party","Boxing Ring","Money Transporter",
						"Sauna","Stock Market","Elevator","'I am lost!'","Wedding",
						"Hogwarts", "Speed Dating", "Creamary/Diary", "Aquarium", "Handbag",
						"Hairdresser", "Foot Care", "Cooking TV Show", "Matrix", "Shared-Flat Kitchen",
						"White House", "Football Goal","Fitness Studio","Top of Eiffel Tower", "Graduation Party"}


local numOfLocsSet3 = 30 --this is the template location set that shows only numbers so players can use their own locations written on a paper
local locationsSet3 = { "1", "2", "3", "4","5","6","7","8","9","10",
						"11", "12", "13", "14","15","16","17","18","19","20",
						"21", "22", "23", "24","25","26","27","28","29","30" }
local locationsSet3Eng = { "","","","","","","","","","",
							"","","","","","","","","","",
							"","","","","","","","","",""}


--save this to mydata
myData.numOfLocsSet1 = numOfLocsSet1
myData.locationsSet1 = locationsSet1
myData.locationsSet1Eng = locationsSet1Eng
myData.numOfLocsSet2 = numOfLocsSet2
myData.locationsSet2 = locationsSet2
myData.locationsSet2Eng = locationsSet2Eng
myData.numOfLocsSet3 = numOfLocsSet3
myData.locationsSet3 = locationsSet3
myData.locationsSet3Eng = locationsSet3Eng


-- event listeners for tab buttons:
local function onModeSetView( event )
	composer.gotoScene( "view_modeset" )
end

-- create a tabBar widget with two buttons at the bottom of the screen

--[[ table to setup buttons
local tabButtons = {
	{ label="Home &\nSettings", width = 32, height = 32, onPress=onHomeView, selected=true }, --defaultFile="icon1.png", overFile="icon1-down.png"
	{ label="Roles", defaultFile="Icon-ldpi.png", overFile="Icon-ldpi.png", width = 32, height = 32, onPress=onRolesView }, --defaultFile="icon2.png", overFile="icon2-down.png"
	{ label="Help", width = 32, height = 32, onPress=onHelpView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight-8 ,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}
--]]
onModeSetView()	-- invoke first tab button's onPress event manually