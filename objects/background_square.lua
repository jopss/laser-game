Background_Square = {}
Background_Square.__index = Background_Square
Background_Square.referenceX = nil
Background_Square.referenceY = nil

self = Background_Square

function self:new(obj)
    setmetatable(obj, self)
    return obj
end

function self:show(group, screen)
    local back = display.newRect( 0, 0, screen.screenW, screen.screenH )
    back:setFillColor( 255, 0, 0 )
    group:insert( back )
    
    --insere as bordas superiores
    local positionX = 0
    local positionY = 0
    local brick = nil --objeto de referencia para tamanhos
    
    for i = 1, 13 do
        brick = require "objects.items.brick"
        brick = brick:new{}
        brick:show(screen, group, positionX, positionY, false)
        positionX = positionX + brick.parent.object.width
    end
    
    self.referenceX = brick.parent.object.width
    self.referenceY = brick.parent.object.height

    --insere as bordas inferiores
    positionX = 0
    positionY = screen.screenH - brick.parent.object.height
    
    for i = 1, 13 do
        brick = require "objects.items.brick"
        brick = brick:new{}
        brick:show(screen, group, positionX, positionY, false)
        positionX = positionX + brick.parent.object.width
    end
    
    --insere as bordas esqueda
    positionX = 0
    positionY = brick.parent.object.height
    
    for i = 1, 8 do
        brick = require "objects.items.brick"
        brick = brick:new{}
        brick:show(screen, group, positionX, positionY, false)
        positionY = positionY + brick.parent.object.height
    end
    
    --insere as bordas direita
    positionX = screen.screenW - 3*brick.parent.object.width
    positionY = brick.parent.object.height
    
    for i = 1, 8 do
        brick = require "objects.items.brick"
        brick = brick:new{}
        brick:show(screen, group, positionX, positionY, false)
        positionY = positionY + brick.parent.object.height
    end
    
end

return self

