function love.load()
   target = {}
   target.image = love.graphics.newImage('sprites/moon2.png')
   target.size = 80 -- image pixels is 80x80
   target.x = love.graphics.getWidth()/2 - target.size/2 -- minus half moon size
   target.y = love.graphics.getHeight()/2 - target.size/2

   background = love.graphics.newImage('sprites/background.png')
   
   score = 0
   timer = 0
   
   gameFont = love.graphics.newFont(30)
end

function love.draw()
   love.graphics.draw(background, 0, 0)
   love.graphics.draw(target.image, target.x, target.y)
   
   love.graphics.setColor(1, 1, 1)
   love.graphics.setFont(gameFont)
   love.graphics.print(score, 5, 0)
   --love.graphics.print(love.graphics.getWidth(), 100, 0)
   --love.graphics.print(love.graphics.getHeight(), 200, 0)
end

function love.mousepressed(x, y, button, istouch, presses)
   if button == 1 then
      -- calculates the distance between the center of the image and the mouse pointer
      -- simulates a circle radius
      local mouseToTarget = pointsDistance(x, y, target.x+target.size/2, target.y+target.size/2) 
      if mouseToTarget < target.size/2 then  
	 score = score + 1
	 target.x = math.random(0, love.graphics.getWidth()-target.size)
	 target.y = math.random(0, love.graphics.getHeight()-target.size)
      end
   end
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   elseif key == "r" then
      love.load()
   end
end

function pointsDistance(x1, y1, x2, y2)
   return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
