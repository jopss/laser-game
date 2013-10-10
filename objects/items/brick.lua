Brick = {}
Brick.__index = Brick
Brick.parent = require( "objects.items.object" )

self = Brick

function self:new(obj)
    setmetatable(obj, self)
    return obj
end

function self:show(screen, group, positionX, positionY, isFullResolution)
    self.parent:initialize(screen, group, positionX, positionY)
    
    local image = display.newImage( self.parent.group, "/images/inanimate/brick.png", self.parent.positionX, self.parent.positionY, isFullResolution )
    image:setReferencePoint( display.CenterReferencePoint )
    
    --bounce 1.0 nao possui propriedade 'saltitante'
    self.parent.screen.physics.addBody(image, "kinematic", {density=1.0, friction=0.3, bounce=1.0})
    
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
