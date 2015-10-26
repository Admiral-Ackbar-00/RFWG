
function menu_load()
	welcome = "New World: A Random Fantasy World Generator"
	earth_globe = love.graphics.newImage("images/earth_globe.png")
	love.graphics.setBackgroundColor(0,0,0)
	
	gamestate = "menu"	
	
	menubutton = {}
	menubutton[1] = {text = "1. Start", x = 430, y = 150, execute=createworld}
	menubutton[2] = {text = "2. Load", x = 430, y = 200, execute=loadgame}
	menubutton[3] = {text = "3. Options", x = 430, y = 250, execute=options}
	menubutton[4] = {text = "4. Credits", x = 430, y = 300, execute=credits}
	menubutton[5] = {text = "5. Quit", x = 430, y = 350, execute=exitgame}
end

function menu_draw()
		
	love.graphics.setFont(titlefont)
	love.graphics.printf(welcome,5,5,1024,"left")
	love.graphics.setColor(255,255,255)
	love.graphics.draw(earth_globe, 15, 60)
	
	--draws and highlights the buttons out of the menubutton table.	
		
	for i, v in ipairs(menubutton) do
			if v.mouseover == false then 
				love.graphics.setColor(255,255,255)
			end
			if v.mouseover == true then 
				love.graphics.setColor(146, 147, 146)
			end	
		love.graphics.setFont(boldfont)
		love.graphics.printf(v.text,v.x,v.y,500,"left")	
	end--end for loop
end

function menu_update(dt)
menu_button_check()
end

function menu_mousepressed(x,y,button)
	for i, v in pairs(menubutton) do
		if mousex > v.x and mousex < v.x + boldfont:getWidth(v.text) and mousey > v.y and mousey < v.y + boldfont:getWidth(v.text) then
			v.execute()
		end
	end	
end

function menu_button_check()
	for i,v in ipairs(menubutton) do
		if mousex > v.x and mousex < v.x + boldfont:getWidth(v.text) and mousey > v.y and mousey < v.y + boldfont:getHeight(v.text) then
			v.mouseover = true
		else
			v.mouseover = false
		end
	end
end

function createworld()
	gamestate = "createworld"
	creation_menu_load()
end

function exitgame()
	love.event.push("quit")
end

function loadgame()
	gamestate = "loadgame"
end

function options()
	gamestate = "options"
end

function credits()
	gamestate = "credits"
end