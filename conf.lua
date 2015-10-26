require "cupid"

function love.conf(t)
    t.window.width = 1280 -- sets the width of the application
    t.window.height = 800-- sets the height of the application
	
	t.modules.joystick = false
	
	t.window.title = "Random Fantasy World Generator 0.01"
	t.window.icon = "images/earth_globe_icon.png"
	end
