GunGreen = {}
GunGreen.__index = GunGreen
GunGreen.parent = require( "objects.items.object" )

self = GunGreen

function self:new(obj)
    setmetatable(obj, self)
    return obj
end

function self:show(screen, group, positionX, positionY, isFullResolution)
    self.parent:initialize(screen, group, positionX, positionY)
    
    local image = display.newImage( self.parent.group, "/images/animate/gun_green.png", self.parent.positionX, self.parent.positionY, isFullResolution )
    image:setReferencePoint( display.CenterReferencePoint )
    
    --bounce 1.0 nao possui propriedade 'saltitante'
    --densidade forte
    --sem friccao, fixo
    self.parent.screen.physics.addBody(image, "static", {density=5.0, friction=1.0, bounce=1.0})
    
    self.parent:setObject(image)
end

function self:alpha(value)
    self.parent:alpha(value)
end

function self:visible()
    self.parent:visible()
end

function self:hidden()
    self.parent:hidden()
end

function self:rotate(deltaAngle)
    self.parent:rotate(deltaAngle)
end

function self:move(x, y)
    self.parent:move(x, y)
end

function self:delete()
    self.parent:delete()
end

return self
