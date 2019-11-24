-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local rulestext = [[ 

'Catch the Mole' ist ein durch 'Spyfall' (by Cryptozoic Entertainment) inspiriertes Rollenspiel für 3-20 Spieler. Die meisten hier angeführten Regeln sind flexibel gestaltbar. Da jede Spielergruppe anders ist, sollten die Regeln je nach Lust und Laune angepasst werden.

Als generelle Spielvorbereitung empfielt es sich, alle möglichen Locations mit denen ihr Spielt auf MEHERERE Zettel zu schreiben und vor den Spielern auszulegen, damit jeder Spieler jederzeit die möglichen Locations durchstöbern kann - einer unter euch will dabei besonders ungern erwischt werden ;) (Um alle Locations eines bestimmten Sets anzuzeigen, staret einen beliebigen Spielmodus, wählt eure Location aus und klickt euch durch die Rollenverteilung - am Ende gelangt ihr zum Meno "Location Overview" des gewählten Locationsets.)




======= Normales Spiel =======



(1) Vorbereitung
Nach Eingabe der gewünschten Spieler- und Spionanzahl (standardmäßig 1 Spion), wird jedem Spieler eine Rolle zugewiesen. Nicht-Spion-Spieler bekommen zusätzlich den zufällig ausgewählten 'Spielort' mitgeteilt - die Spione wissen diesen nicht. Pro Spielrunde bekommt jeder Spieler DENSELBEN Spielort zugeteilt.

Aufgabe des Spions ist es, den Spielort (Location) herauszufinden, die anderen Spieler versuchen gleichzeitig, den Spion zu identifizieren.

Nachdem im Startbildschrim "START GAME" ausgewählt wurde, wird das Handy im Uhrzeigersinn von Spieler zu Spieler gereicht. Jeder Spieler sieht im geheimen auf das Display, drückt auf 'Show my role' und erfährt dadurch entweder die geheime Location oder, dass er/sie der Spion ist. Danach wird die Information mit 'OK' bestätigt und das Handy an den nächsten Spieler weitergereicht.

Es stehen zwei verschiedene LocationSets zur Auswahl: 'default' (Standardset mit 30 Locations ähnlich wie im Originalspiel), 'alternate' (weiteres Set mit 30 anderen Locations) sowie 'def+alt' (eine Kombination aus beiden Sets mit insgesamt 45 Locations). Zusätzlich gibt es das Set "template" - dieses Set zeigt euch nur eine Zahl zwischen 1 und 30 damit ihr eure eigenen Locations verwenden könnt (schreibt diese, am besten bei einem Brainstorming zu beginn des Spiels) auf einen oder mehrere Zettel.


(2) Ablauf
Der verdächtigste Spieler beginnt das Spiel (oder jener, der am Ende der Rollenverteilung ausgewählt wurde). Der Spieler an der Reihe darf einem anderen Mitspieler eine beliebige Frage stellen, zum Beispiel 'Markus, wie bist du heute hier her gekommen?'. Markus muss diese Frage anschließend beantworten - er will den anderen Mitspielern zeigen, dass er den geheimen Ort kennt, jedoch darf er nicht zu viel Information für die Spione preis geben.

Hat ein Spieler die an ihn gerichtete Frage beantwortet, ist er/sie als nächstes dran, darf jedoch nicht jenen Spieler fragen von dem er/sie gerade etwas gefragt wurde.


(3) Spielende
Sobald einer der Spione denkt, den geheimen Ort erraten zu haben, gibt er/sie sich zu erkennen und gibt seinen/ihren Tipp über den geheimen Ort preis. Falls der Spion richtig liegt, gewinnen alle Spione diese Runde.

Damit die Nicht-Spione gewinnen, müssen sie alle Spione entdecken. Dazu wird in regelmäßigen Abständen (z.B. nach jeweils 2 Minuten) eine (geheime) Vorabstimmung abgehalten. Wer denkt, dass er den Spion entdeckt hat, der stimmt mit JA (Daumen nach oben), wer sich unsicher ist, stimmt mit NEIN (Daumen nach unten). Alle Spieler stimmen zeitgleich auf das Kommando eines Spielers ab.

Wurde bei der 'Vorabstimmung' eine einfache Mehrheit erzielt, so erfolgt direkt danach die Abstimmung über den Spion. Wiederum auf Kommando zeigt JEDER Mitspieler (auch die Spione) auf jene Person, die er für den Spion hält. Wurde ein Spion von der Mehrheit der Spieler ausgewählt, so muss er/sie sich als Spion zu erkennen geben - alle Spione verlieren in diesem Fall das Spiel. Wurde keine Einstimmigkeit erreicht, so kann das Spiel fortgeführt (für große Gruppen) oder beendet werden (die Spione gewinnen sofort das Spiel).

Kommt es bei der Vorabstimmung zu keiner Mehrheit, geht das Spiel wie gewohnt weiter. Meistens empfielt es sich, die Spieldauer durch (Anzahl der Spieler) * (2 minuten) zu begrenzen. Wurden die Spione nicht entdeckt, gewinnen sie da Spiel.

Wie eingangs erwähnt, können alle Regeln (vorallem bezüglich Spieldauer und Abstimmmechanismus) beliebig abgeändert werden. Es lohnt sich, zu experimentieren!

Hinweis 1: Die Standardvariante des Spiels enthält stets nur einen Spion. Gibt es jedoch mehr als ca. 6 Mitspieler, sollte über die Möglichkeit eines zweiten Spions nachgedacht werden. Am Besten einfach ausprobieren!

Hinweis 2: Die Spielvariante "zufällige Anzahl an Spionen" (random) ist ein experimentelles Feature und sollte nur von erfahrenen Spielern gewählt werden, die sich bereits über die Konsequenzen bei den Abstimmungen Gedanken gemacht haben.


(4) Ein paar Fragen für den Start
"Wie bist du eigentlich hier her gekommen?"
"Wie lange bist du schon hier?"
"Kann man hier in der Nähe gut Essen gehen?"
"Wie oft bist du hier?"
"Was zieht man hier so an?"


(5) Tips und Tricks
Manchmal kann es nützlich und lustig sein, einer sehr verdächtigen Person besonders absurde oder irreführende Fragen zu stellen, zB (Location: U-Boot): "Findest du nicht auch, dass hier mal wieder der Rasen gemäht werden sollte?"

Nehmt die Regeln und die Zeitlimits im Spiel nicht zu ernst: es geht um den Spaß und umso mehr Trash-Talk, umso besser! (Oh, du siehst aber verdächtig aus. Ich bin mir sicher, nur ein Spion trägt zu dieser Jahreszeti einen Kapuzenpulli...)

Benutzt eure eigenen Locations! Schreibt 30 Locations auf einen Zettel und wählt das Location-Set: template

Viel Spaß mit Catch The Mole!





=== Team Spiel (experimentell) ===


Diese Variante von Catch the Mole ist nicht im Originalspiel "Spyfall" enthalten.

(1) Vorbereitung
Die Teamvariante von Catch the Mole sollte erst gespielt werden, wenn ihr eine Partien des normalen Spiels ausgefochten habt. Dieser Modus ist etwas schwieriger und ein wenig ernster als der normale Modus, bietet dafür aber mehr Spieltiefe und kann sehr spannend sein. (Es kann sinnvoll sein, dass sich jeder Spieler sich im Laufe des Spiels (geheime) Notizen macht.)
Bei der Teamvariante bekommt jedes Team eine eigene Location (welche niemals mit der Location eines anderes Team übereinstimmt). Ziel des Spiels ist es, sowohl die gegnerische Location, als auch alle eigenen Teammitglieder zu identifizieren.

(2) Spielende (viele Varianten)
Random-Variante: Gespielt wird mit einer zufälligen Anzahl an Teams (wobei alles zwischen "alle sind im gleichen Team" bis zu "jeder ist sein eigenes Team" möglich ist). Die Aufteilung der Spieler auf die Teams erfolgt dabei zufällig, aber gleichverteilt: auch wenn nicht alle Teams gleich viele Spieler haben, so beträgt der Unterschied zwischen dem Team mit den wenigsten Spielern und dem Team mit den meisten Spielern stets maximal einen Spieler.
Ziel der Spieler ist es herauszufinden, welche Spieler gemeinsam in einem Team sind. Zusätzlich kann jeder Spieler versuchen, die Location der anderen Spieler herauszufinden.
Folgender Punkte-Mechanismus hat sich für die Random-Variante als nützlich herausgestellt: glaubt ein Spieler, alle Teams identifiziert zu haben, schreibt er seine Lösung auf ein Blatt Papier (zB indem alle Spielernamen auf den Zettel geschrieben werden und Teamkollegen jeweils eingekreist werden). Dann faltet der Spieler das Blatt Papier so um, dass seine Lösung nicht mehr zu sehen ist und legt das Blatt in die Mitte des Tisches. Jeder Spieler darf pro Runde nur einmal etwas auf das Blatt Papier schreiben.
Punkteverteilung: hat der Vorletzte Spieler seinen Tipp abgegeben, endet das Spiel damit, indem auch der letzte verbleibende Spieler seinen Tipp auf das Papier schreibt. Anschließend wird aufgelöst: jeder gibt seine Location und damit seine Team-Zugehörigkeit preis. Anschließend wird, beginnend mit dem Spieler der zuletzt seinen Tipp abgegeben hat, nach und nach jeder Tipp vorgelesen. Ist ein Tipp KOMPLETT richtig (es wurde also alle Teams richtig identifiziert) so erhält der Spieler Punkte nach folgendem Schema:
Der Spieler, der als erstes seinen Tipp abgegeben hat, bekommt Punkte in der Anzahl der teilnehmenden Spieler. Der zweite Spieler der seinen Tipp abgegeben hat, bekommt (falls seine Antwort komplett richtig war) einen Punkt weniger, usw. Der letzte Spieler kann also noch immerhin einen Punkt erzielen. Ist eine Antwort eines Spielers falsch, bekommt er keinen Punkt.
Spieler können zusatzpunkte erhalten, wenn sie zusätzlich zu den Teamzugehörigkeiten auch eine Location eines (beliebigen gegnerischen) Teams erraten haben. Dafür gibt es einen extra Punkt. Ein falscher Tipp für eine Location bedeutet nicht, dass der Spieler all seine Punkte durch das Erraten der Teamzugehörigkeit verliert.
Zusatzregel für Spielbalance: Damit Spieler auch im späteren Spielverlauf noch "sinnvolle" Antworten geben, kann es sinnvoll sein, folgende Regel einzuführen: Jeder Spieler, der in einem Team mit mindestens 2 Spielern ist bekommt nur dann Punkte für das Erraten von Teams wenn zumindest eines seiner Teammitglieder den Spieler korrekt in das jeweilige Team eingeordnet hat (oder der Spieler bekommt einen extra Punkt für jedes seiner Teammitglieder, das ihn richtig in das Team eingeordnet hat).
Wichtiger Tipp: Verstrickt euch nicht ins Punktezählen und wer das Spiel am Ende gewinnt - bei der Teamvariante sollte immer noch der Spaß im Vordergrund stehen ;)

Andere, einfachere Teamvarianten (fixe Anzhal an Teams):
Es gewinnt jenes Team, welches zuerst die gegnerische Location herausgefunden hat (und/oder wenn ein Spieler alle eigenen Teammitglieder identifizieren konnte).
Variante 1: Jeder Spieler darf zu jedem Zeitpunkt das Spiel beenden, indem er all jene Spieler benennt von denen er glaubt, dass sie in seinem Team sind. Anschließend gibt er seine Location bekannt und die Spieler bestätigen ihre Teamzugehörigkeit. Lag der Spieler richtig, so gewinnt dieses Team.
Variante 2: Jeder Spieler darf zu jedem Zeitpunkt das Spiel beenden, indem er seinen Tipp über die gegnerische Location bekannt gibt. Liegt der Spieler richtig, so gewinnt sein Team.
Variante 3 (empfohlen): Wie Variate 1 und 2 kombiniert: ein Spieler muss sowohl sein eigenes Team, als auch die gegnerische Location erraten können.


Viel Spaß mit der Teamversion von Catch The Mole!


PS: Falls ihr Ideen für neue Locations oder einen neuen Spielmodus habt, dann schickt eure Vorschläge an obnebion42@gmail.com :)


]]

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
	local title = display.newText( "Help & Rules", display.contentCenterX, 20, native.systemFont, 40 )
	title:setFillColor( unpack(myGray) ) -- change color of text

	-- Draw red line
	local line = display.newRect( display.contentCenterX, 50, 230, 2 )
	line:setFillColor( unpack(myGray) )
	
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
	local paragraph
	local tmpString = rulestext

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
	    fontSize = 16,
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