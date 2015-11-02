require "creation"
require "menu"

--ANY COMMENT HERE

--needed so when we call, it wont overwrite the love.load function
function load()
end

function selector(range1, range2)
   outcome = math.random(range1, range2)
end

function love.load()
	gamestate = "menu"

	--specifies the fonts to be used
	titlefont = love.graphics.newFont("/LIBRARIES/fonts/Open_Sans/OpenSans-ExtraBold.ttf",40)
	boldfont = love.graphics.newFont("/LIBRARIES/fonts/Open_Sans/OpenSans-Bold.ttf",30)
	regularfont = love.graphics.newFont("/LIBRARIES/fonts/Open_Sans/OpenSans-Regular.ttf",15)
	lightfont = love.graphics.newFont("/LIBRARIES/fonts/Open_Sans/OpenSans-Light.ttf",10)
	smallfont = love.graphics.newFont("/LIBRARIES/fonts/Open_Sans/OpenSans-Light.ttf",8)
	xsmallfont = love.graphics.newFont("/LIBRARIES/fonts/Open_Sans/OpenSans-Light.ttf",6)
	
	menu_load()
	
end

function love.draw()
	
	if gamestate == "menu" then
		menu_draw()
	elseif gamestate == "createworld" then
		creation_menu_draw()
	elseif gamestate == "exitgame" then
		love.quit()
	elseif gamestate == "loadgame" then	
		love.graphics.printf("PRESSED THE LOAD BUTTON",5,5,1024,"left")
	elseif gamestate == "options" then	
		love.graphics.printf("PRESSED THE OPTIONS BUTTON",5,5,1024,"left")
	elseif gamestate == "credits" then
		love.graphics.printf("PRESSED THE CREDITS BUTTON",5,5,1024,"left")	
	elseif gamestate == "worldhook" then
		creation_menu_draw()
	elseif gamestate == "worldsize" then
		creation_menu_draw()
	elseif gamestate == "worldhydro" then
		creation_menu_draw()
	elseif gamestate == "landandwaterdistro" then
		creation_menu_draw()	
	end
	
	--displays the current gamestate in bottom lefthand corner
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(lightfont)
	love.graphics.printf(gamestate, 1200, 780, 100, "left")
end 

function love.update(dt)
	mousex = love.mouse.getX()
	mousey = love.mouse.getY()
	
	if gamestate == "menu" then
		menu_update(dt)
	elseif gamestate == "createworld" then
		creation_menu_update(dt)
	elseif gamestate == "exitgame" then
		love.quit()
	elseif gamestate == "worldhook" then
		creation_menu_update(dt)
	elseif gamestate == "worldsize" then
		creation_menu_update(dt)	
	elseif gamestate == "worldhydro" then
		creation_menu_update(dt)
	elseif gamestate == "landandwaterdistro" then
		creation_menu_update(dt)		
	end
end

function love.mousepressed(x,y,button)
	if gamestate == "menu" then
		menu_mousepressed(x,y,button)
	elseif gamestate == "createworld" then
		creation_menu_mousepressed(x,y,button)
	elseif gamestate == "exitgame" then
		love.quit()
	elseif gamestate == "worldhook" then
		creation_menu_mousepressed(x,y,button)
	elseif gamestate == "worldsize" then
		creation_menu_mousepressed(x,y,button)	
	elseif gamestate == "worldhydro" then
		creation_menu_mousepressed(x,y,button)	
	elseif gamestate == "landandwaterdistro" then
		creation_menu_mousepressed(x,y,button)	
	end
end

function love.mousereleased(x,y,button)
end

function love.keypressed(x,y,button)
end

function love.keyreleased(x,y,button)
end

function love.quit()
	love.event.push("quit")
end