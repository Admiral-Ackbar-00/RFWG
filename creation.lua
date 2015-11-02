
creation = "Welcome to the Creation Screen"


function creation_menu_load()
	
	--loads the file
	local worldhooks = love.filesystem.load("/LIBRARIES/CREATION/worldhooks.lua")()	
	local worldsize = love.filesystem.load("/LIBRARIES/CREATION/worldsize.lua")()
	local worldhydro = love.filesystem.load("/LIBRARIES/CREATION/worldhydro.lua")()		
	local landandwaterdistro = love.filesystem.load("/LIBRARIES/CREATION/landandwaterdistro.lua")()	
	
	whiteboard = love.graphics.newCanvas(1280, 800) 	
	
	creationbutton = {}
	creationbutton[1] = {text = "1. World Hooks", x = 430, y = 100, execute=worldhook}
	creationbutton[2] = {text = "2. World Size", x = 430, y = 150, execute=world_size}
	creationbutton[3] = {text = "3. World Hydrography", x = 430, y = 200, execute=world_hydro}
	creationbutton[4] = {text = "4. Regional Land and Water Distribution", x = 430, y = 250, execute=landandwaterdistro}
	creationbutton[5] = {text = "5. Save options", x = 430, y = 300, execute=save}
	creationbutton[6] = {text = "6. Back to Creation Menu", x = 430, y = 350, execute=createworld}
	creationbutton[7] = {text = "7. Back to Main Menu", x = 430, y = 400, execute=menu}
	creationbutton[8] = {text = "8. Quit to Desktop", x = 430, y = 450, execute=quit}
	
	
end

function creation_menu_draw()
    
	--draws background image
	love.graphics.draw(earth_globe, 15, 60)
	love.graphics.setFont(titlefont)
	love.graphics.getBackgroundColor(0,0,0)
	love.graphics.setColor(255,0,255)
	love.graphics.printf(creation,5,5,1024,"left")
	
	--we need a canvas to draw on
		love.graphics.setCanvas(canvas)
		whiteboard:clear()
		love.graphics.setBlendMode('alpha')
		love.graphics.setColor(30, 30, 30)
		
		--Draws a rectangle at x: 750, y: 30 with a width of 660 and a height of 790
		love.graphics.rectangle( "fill", 750, 30, 660, 790)
		love.graphics.setBlendMode('alpha')
		love.graphics.draw(whiteboard, 600, 50)
	
	
	--draws the buttons out of the button table.	
	if gamestate == "createworld" then
		for i, v in ipairs(creationbutton) do
			if v.mouseover == false then 
				love.graphics.setColor(255,255,255)
			end
			if v.mouseover == true then 
				love.graphics.setColor(146, 147, 146)
			end	
		love.graphics.setFont(regularfont)
		love.graphics.printf(v.text,v.x,v.y,300,"left")	
		end

	elseif gamestate == "worldhook" then

		--once the worldhooks option is selected, this makes the creation buttons visible
		love.graphics.setColor(146, 147, 146)
		love.graphics.setFont(boldfont)
		love.graphics.printf(creationbutton[1].text, creationbutton[1].x, creationbutton[1].y, 500, "left")
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(regularfont)		
		love.graphics.printf(creationbutton[5].text, creationbutton[5].x, creationbutton[5].y, 500, "left")	
		love.graphics.printf(creationbutton[6].text, creationbutton[6].x, creationbutton[6].y, 500, "left")	
		love.graphics.printf(creationbutton[7].text, creationbutton[7].x, creationbutton[7].y, 500, "left")	
		love.graphics.printf(creationbutton[8].text, creationbutton[8].x, creationbutton[8].y, 500, "left")	
		
		for i, v in ipairs(worldhooks) do
			if v.mouseover == false then 
				love.graphics.setColor(255,255,255)
			elseif v.mouseover == true then 
				love.graphics.setColor(146, 147, 146)
			end	
		love.graphics.setFont(regularfont)
		love.graphics.printf(v.text,v.x,v.y,300,"left")	
		end
		
	elseif gamestate == "worldsize" then
		--once the worldsize option is selected, this makes the creation buttons visibles	
		love.graphics.setColor(146, 147, 146)
		love.graphics.setFont(boldfont)
		love.graphics.printf(creationbutton[2].text, creationbutton[2].x, creationbutton[2].y, 500, "left")
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(regularfont)		
		love.graphics.printf(creationbutton[5].text, creationbutton[5].x, creationbutton[5].y, 500, "left")	
		love.graphics.printf(creationbutton[6].text, creationbutton[6].x, creationbutton[6].y, 500, "left")	
		love.graphics.printf(creationbutton[7].text, creationbutton[7].x, creationbutton[7].y, 500, "left")
		love.graphics.printf(creationbutton[8].text, creationbutton[8].x, creationbutton[8].y, 500, "left")			
		
		--we need a canvas to draw on
		love.graphics.setCanvas(canvas)
		whiteboard:clear()
		love.graphics.setBlendMode('alpha')
		love.graphics.setColor(30, 30, 30)
		
		--Draws a rectangle at x: 750, y: 30 with a width of 660 and a height of 790
		love.graphics.rectangle( "fill", 750, 30, 660, 790)
		love.graphics.setBlendMode('alpha')
		love.graphics.draw(whiteboard, 600, 50)
		
		for i, v in ipairs(worldsize) do
			if v.mouseover == false then 
				love.graphics.setColor(255,255,255)
			end
			if v.mouseover == true then 
				love.graphics.setColor(146, 147, 146)
			end	
		love.graphics.setFont(regularfont)
		love.graphics.printf(v.text,v.x,v.y,300,"left")		
		end
	
	elseif gamestate == "worldhydro" then
		--once the world hydro. option is selected, this makes the creation buttons visible	
		love.graphics.setColor(146, 147, 146)
		love.graphics.setFont(boldfont)
		love.graphics.printf(creationbutton[3].text, creationbutton[3].x, creationbutton[3].y, 500, "left")
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(regularfont)
		love.graphics.printf(creationbutton[5].text, creationbutton[5].x, creationbutton[5].y, 500, "left")	
		love.graphics.printf(creationbutton[6].text, creationbutton[6].x, creationbutton[6].y, 500, "left")	
		love.graphics.printf(creationbutton[7].text, creationbutton[7].x, creationbutton[7].y, 500, "left")
		love.graphics.printf(creationbutton[8].text, creationbutton[8].x, creationbutton[8].y, 500, "left")			
		
		--we need a canvas to draw on
		love.graphics.setCanvas(canvas)
		whiteboard:clear()
		love.graphics.setBlendMode('alpha')
		love.graphics.setColor(30, 30, 30)
		
		--Draws a rectangle at x: 750, y: 30 with a width of 660 and a height of 790
		love.graphics.rectangle( "fill", 750, 30, 660, 790)
		love.graphics.setBlendMode('alpha')
		love.graphics.draw(whiteboard, 600, 50)
		
		for i, v in ipairs(worldhydro) do
			if v.mouseover == false then 
				love.graphics.setColor(255,255,255)
			end
			if v.mouseover == true then 
				love.graphics.setColor(146, 147, 146)
			end	
		love.graphics.setFont(regularfont)
		love.graphics.printf(v.text,v.x,v.y,300,"left")		
		end
	
	elseif gamestate == "landandwaterdistro" then

		--once the landandwaterdistro option is selected, this makes the creation buttons visible		
		love.graphics.setColor(146, 147, 146)
		love.graphics.setFont(boldfont)
		love.graphics.printf(creationbutton[4].text, creationbutton[4].x, creationbutton[4].y, 500, "left")
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(regularfont)		
		love.graphics.printf(creationbutton[5].text, creationbutton[5].x, creationbutton[5].y, 500, "left")	
		love.graphics.printf(creationbutton[6].text, creationbutton[6].x, creationbutton[6].y, 500, "left")	
		love.graphics.printf(creationbutton[7].text, creationbutton[7].x, creationbutton[7].y, 500, "left")	
		love.graphics.printf(creationbutton[8].text, creationbutton[8].x, creationbutton[8].y, 500, "left")	
		
		for i, v in ipairs(landandwaterdistro) do
			if v.mouseover == false then 
				love.graphics.setColor(255,255,255)
			elseif v.mouseover == true then 
				love.graphics.setColor(146, 147, 146)
			end	
		love.graphics.setFont(regularfont)
		love.graphics.printf(v.text,v.x,v.y,300,"left")	
		end
	
	end	--end elseif for gamestate worldhook
end

function creation_menu_update(dt)
	creation_button_check()
end

function creation_menu_mousepressed(x,y,button)
--no matter what gamestate we are in, if you click on a Creations menu item, it will execute.
	for i, v in pairs(creationbutton) do
		if mousex > v.x and mousex < v.x + boldfont:getWidth(v.text) and mousey > v.y and mousey < v.y + boldfont:getHeight(v.text) then
			v.execute()
		end
		
	end	--end for loop
end

function creation_button_check()
	if gamestate == "createworld" then
		for i,v in ipairs(creationbutton) do
			if mousex > v.x and mousex < v.x + regularfont:getWidth(v.text) and mousey > v.y and mousey < v.y + regularfont:getHeight(v.text) then
				v.mouseover = true
			else
				v.mouseover = false
			end	--end if statement
		end --end for loop
	elseif gamestate == "worldhook" then
		for i,v in ipairs(worldhooks) do
			if mousex > v.x and mousex < v.x + regularfont:getWidth(v.text) and mousey > v.y and mousey < v.y + regularfont:getHeight(v.text) then
				v.mouseover = true
			else
				v.mouseover = false
			end	--end if statement
		end--end for loop
	elseif gamestate == "worldsize" then
		for i,v in ipairs(worldsize) do
			if mousex > v.x and mousex < v.x + regularfont:getWidth(v.text) and mousey > v.y and mousey < v.y + regularfont:getHeight(v.text) then
				v.mouseover = true
			else
				v.mouseover = false
			end	--end if statement
		end--end for loop	
	elseif gamestate == "worldhydro" then
		for i,v in ipairs(worldhydro) do
			if mousex > v.x and mousex < v.x + regularfont:getWidth(v.text) and mousey > v.y and mousey < v.y + regularfont:getHeight(v.text) then
				v.mouseover = true
			else
				v.mouseover = false
			end	--end if statement
		end--end for loop	
	elseif gamestate == "landandwaterdistro" then
		for i,v in ipairs(landandwaterdistro) do
			if mousex > v.x and mousex < v.x + regularfont:getWidth(v.text) and mousey > v.y and mousey < v.y + regularfont:getHeight(v.text) then
				v.mouseover = true
			else
				v.mouseover = false
			end	--end if statement
		end--end for loop	
	end--end elseif
end

function createworld()
	gamestate = "createworld"
	creation_menu_load()
end

function worldhook()
	gamestate = "worldhook"
end

function world_size()
	gamestate = "worldsize"
end

function world_hydro()
	gamestate = "worldhydro"
end

function landandwaterdistro()
	gamestate = "landandwaterdistro"
end

function save()
	gamestate = "save"
end

function menu()
	gamestate = "menu"
end

function quit()
	love.event.push("quit")
end	
