button = {}

function button_spawn(x,y,text,id)
   table.insert(button, {x = x, y = y, text = text, id = id, mouseover = false})
end

function button_draw()
for i,v in ipairs(button) do
   if v.mouseover == false then
      love.graphics.setColor(0,0,0)
   end
   if v.mouseover == true then
      love.graphics.setColor(0,255,255)
   end
   love.graphics.setFont(buttonFont)
   love.graphics.print(v.text,v.x,v.y)

end
end

function button_click(x,y)
   for i,v in ipairs(button) do
      if x > v.x and 
         x< v.x + buttonFont:getWidth(v.text) and
         y > v.y and 
         y < v.y + buttonFont:getHeight() then
         if v.id == "quit" then
            love.event.push("quit")
         end
         if v.id == "start" then
            gamestate = "playing"
         end
      end
   end
end


function button_check()
for i,v in ipairs(button) do
   if mousex > v.x and mousex < v.x + buttonFont:getWidth(v.text) and mousey > v.y and mousey < v.y + buttonFont:getHeight(v.text) then
      v.mouseover = true
   else
      v.mouseover = false
   end
end
end