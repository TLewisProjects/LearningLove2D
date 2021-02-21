GameObject = require 'gameobject'

Group = Object:extend()

function Group:new(objects)
    self.objects = {}
    for i, object in ipairs(objects) do
        table.insert(self.objects, object)
    end
end

function Group:update(dt)
    for i, object in ipairs(self.objects) do
        object:update(dt)
    end
end

function Group:draw()
    for i, object in ipairs(self.objects) do
        object:draw()
    end
end

function Group:add(newObject)
    table.insert(self.objects, newObject) 
end

function Group:remove(oldObject)
    table.remove(self.objects, oldObject)
end