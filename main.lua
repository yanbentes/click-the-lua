function love.load()
   target = {}
   target.x = love.graphics.getWidth()/2
   target.y = love.graphics.getHeight()/2
   target.radius = 40
   
   score = 0
   timer = 0
   
   gameFont = love.graphics.newFont(30)
end

function love.update(dt)
   
end

function love.draw()
   love.graphics.setColor(1, 0, 0.2)
   love.graphics.circle("fill", target.x, target.y, target.radius)
   
   love.graphics.setColor(1, 1, 1)
   love.graphics.setFont(gameFont)
   love.graphics.print(score, 0, 0)
end

function love.mousepressed(x, y, button, istouch, presses)
   if button == 1 then
      local mouseToTarget = pointsDistance(x, y, target.x, target.y)
      if mouseToTarget < target.radius then
	 score = score + 1
	 target.x = math.random(target.radius, love.graphics.getWidth()-target.radius)
	 target.y = math.random(target.radius, love.graphics.getHeight()-target.radius)
      end
   end
end

function pointsDistance(x1, y1, x2, y2)
   return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
