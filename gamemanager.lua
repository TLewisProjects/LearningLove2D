local GameObject = require("gameobject")
local Mover = require("mover")
local Enemy = require("enemy")
local class = require("middleclass")
require("group")

local GameManager = class('GameManager')

function GameManager:initialize(cWidth, cHeight, numEnemies)
    enemySprite = love.graphics.newImage("assets/enemy.png")
    self.numEnemies = numEnemies
    self.enemies = {}
    math.randomseed(os.time()) -- random initialize
    math.random(); math.random(); math.random() -- warming up
    for i=1,numEnemies do
        randx = math.random(0, cWidth)
        randy = math.random(0, cHeight)
        local newEnemy = Enemy:new(randx, randy, 500, 0, enemySprite)
        print(newEnemy)
        table.insert(self.enemies, newEnemy)
    end

    randx = math.random(0, cWidth)
    randy = math.random(0, cHeight)
    self.player = Mover:new(randx, randy, 500, 10, 10, 0, 10, 10)

    self.numObjects = numEnemies + 1
    --self.allObjects = {self.player, self.enemies}
end

function GameManager:update(dt)
    for i, object in ipairs(self.enemies) do
        object:update(dt)
    end
end

function GameManager:draw()
    self.player:draw()
    for i, object in ipairs(self.enemies) do
        object:draw()
    end
end

function GameManager:mousepressed(x, y)
    for i, object in ipairs(self.enemies) do
        object:updateTarget(x,y)
    end
end

return GameManager
