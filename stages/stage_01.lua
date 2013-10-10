-- *******************************************************************
-- CARREGAMENTOS INICIAIS
-- *******************************************************************
Stage_01 = {}
Stage_01.__index = Stage_01
Stage_01.parent = require( "stages.stage" )
Stage_01.background = nil
Stage_01.gun = nil

self = Stage_01

function self:new(stage)
    setmetatable(stage, self)
    stage.parent:initialize(stage, "stage_01")
    return stage
end

function self:show()
    self.parent:show("stage_01")
end
function self:enterScene(event)
    self.parent:enterScene(event)
    -- local group = self.parent.scene.view
end
function self:exitScene(event)
    self.parent:exitScene(event)
    -- local group = self.parent.scene.view
end
function self:destroyScene(event)
    self.parent:destroyScene(event)
    -- local group = self.parent.scene.view
end

-- *******************************************************************
-- FUNCOES E VARIAVEIS LOCAIS
-- *******************************************************************

function self:createScene(event)
    self.parent:createScene(event)
    local group = self.parent.scene.view
    
    --insere o plano de fundo
    self.background = require "objects.background_square"
    self.background = self.background:new{}
    self.background:show( group, self.parent )
    
    --insere a arma laser
    positionX = self.background.referenceX
    positionY = 2*self.background.referenceY
    
    self.gun = require "objects.items.gun_blue"
    self.gun = self.gun:new{}
    self.gun:show(self.parent, group, positionX, positionY, false)
    
    --insere o menu lateral
    
end

-- *******************************************************************
-- RETORNA PARA SER UTILIZADO
-- *******************************************************************
return self
