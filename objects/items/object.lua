Object = {}
Object.__index = Object
Object.object = nil
Object.screen = nil
Object.group = nil
Object.positionX = nil
Object.positionY = nil

self = Object

function self:initialize(screen, group, positionX, positionY)
    
    if positionX == nil then
        positionX = 0;
    end
    if positionY == nil then
        positionY = 0;
    end
    
    self.positionX = positionX
    self.positionY = positionY
    self.screen = screen
    self.group = group
end

function self:setObject(object)
    self.object = object
    self.group:insert( object )
end

function self:alpha(value)
    self.object.alpha = value
end

function self:visible()
    self.object.isVisible = true
end

function self:hidden()
    self.object.isVisible = false
end

function self:rotate(deltaAngle)
    self.object:rotate(deltaAngle)
end

function self:move(x, y)
    self.object:translate(x, y)
end

function self:delete()
    self.object:removeSelf()
end

return self
