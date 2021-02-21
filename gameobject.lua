local class = require 'middleclass'

local GameObject = class('GameObject')

function GameObject:initialize(x, y, speed, width, height, layer)
    self.x = x
    self.y = y
    self.speed = speed

    self.width = width
    self.height = height
    self.layer = layer
end

function GameObject:__tostring()
    sring = "x: " .. self.x .. "\n y: " .. self.y
    return sring
end

function GameObject:update(dt)
    print("Updating object")
end

function GameObject:draw()
    love.graphics.rectangle("line", self.x-(self.width/2), self.y-(self.height/2), self.width, self.height)
end


return GameObject