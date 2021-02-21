local class = require('middleclass')
local Mover = require('mover')

local Enemy = class('Enemy', Mover)

function Enemy:initialize(x, y, speed, layer, sprite)
    self.sprite = sprite
    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
    Mover.initialize(self, x, y, speed, self.width, self.height, layer)

end

function Enemy:draw()
    love.graphics.draw(self.sprite, self.x-(self.width/2), self.y-(self.height/2))
    love.graphics.rectangle("line", self.x-(self.width/2), self.y-(self.height/2), self.width, self.height)
    love.graphics.points(self.x, self.y)   -- draw each point
end

return Enemy