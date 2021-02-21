cwide = 520
chigh = 333

love.window.setTitle(' Hello World ')
love.window.setMode(cwide, chigh)

dtotal = 0   -- this keeps track of how much time has passed
fps = 30.0
frameTime = 1/fps
		
function love.load()
	--Don't forget to load the file
	require "gameobject"
	require "mover"
	local GameManager = require "gamemanager"
	require "group"

	gamemanager = GameManager:new(cwide, chigh, 5)
end

function love.update(dt)
   dtotal = dtotal + dt   -- we add the time passed since the last update, probably a very small number like 0.01
   if dtotal >=frameTime then
      dtotal = dtotal - frameTime   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
   end

   gamemanager:update(dt)
end

function love.draw()
	love.graphics.clear( )
	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
	--gamemanager.player:draw()
	gamemanager:draw()
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
	   gamemanager:mousepressed(x, y)
    end
 end
