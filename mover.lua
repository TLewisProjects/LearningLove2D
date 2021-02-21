local GameObject = require('gameobject')
local class = require('middleclass')

--Mover = GameObject:extend()
local Mover = class('Mover', GameObject)

function Mover:initialize(x, y, speed, width, height, layer)
    GameObject.initialize(self, x, y, speed, width, height, layer)

    self.targetx = x
    self.targety = y
    print(self.targetx)
    print(self.targety)
end

function Mover:updateTarget(targetx, targety)
    self.targetx = targetx
    self.targety = targety
end

function Mover:moveToTarget(dt)

    if dt == 0 then
        return nil
    end

    diffX = self.targetx - self.x
    diffY = self.targety - self.y

    if diffX == 0 and diffY == 0 then
        return nil
    end
  
    dist = math.sqrt((diffX*diffX) + (diffY*diffY))
    unitVectorX = diffX/dist
    unitVectorY = diffY/dist
  
    dx = ((unitVectorX*self.speed) * dt)
    dy = ((unitVectorY*self.speed) * dt)
  
    self.x = self.x + dx
    self.y = self.y + dy
    if dist < self.speed*dt then
        self.x = self.targetx
        self.y = self.targety
    end

end

function Mover:update(dt)
    Mover.moveToTarget(self, dt)
end

function Mover:__tostring()
    sring = "x: " .. self.x .. "\n y: " .. self.y
    return sring
end

return Mover
