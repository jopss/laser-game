-- Arquivo generico para funcoes comuns 'stage'

-- *******************************************************************
-- CARREGAMENTOS INICIAIS
-- *******************************************************************
Stage = {}
Stage.scene = nil
Stage.storyboard = require( "storyboard" )
Stage.physics = require( "physics" )
Stage.screenW = nil
Stage.screenH = nil
Stage.halfW = nil
Stage.halfH = nil

self = Stage

function self:initialize(stage, name)
    stage.parent.scene = stage.parent.storyboard.newScene(name)
    
    stage.parent.physics.start()
    --stage.parent.physics.pause()
    stage.parent.physics.setDrawMode("hybrid")
    
    stage.parent.scene:addEventListener( "createScene", stage )
    stage.parent.scene:addEventListener( "enterScene", stage )
    stage.parent.scene:addEventListener( "exitScene", stage )
    stage.parent.scene:addEventListener( "destroyScene", stage )
    
    stage.parent.screenW, stage.parent.screenH, stage.parent.halfW, stage.parent.halfH = display.contentWidth, display.contentHeight, display.contentWidth*0.5, display.contentHeight*0.5
    return stage
end

function self:show( name )
    self.storyboard.gotoScene( name ,{effect = "fade", time=400})
end

-- *******************************************************************
-- FUNCOES DE CENAS E VARIAVEIS LOCAIS
-- *******************************************************************

-- Called immediately after scene has moved onscreen:
function self:enterScene(event)
    self.physics.start()
end

-- Called when scene is about to move offscreen:
function self:exitScene(event)
    self.physics.stop()
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function self:destroyScene(event)
    package.loaded[self.physics] = nil
    self.physics = nil
end

-- Called when the scene's view does not exist:
function self:createScene(event)
    -- nothing
end

-- *******************************************************************
-- RETORNA A CENA PARA SER UTILIZADA
-- *******************************************************************
return self
