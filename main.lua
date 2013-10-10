require "CiderDebugger";
-----------------------------------------------------------------------------------------
-- main.lua
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )
local stage_01 = require "stages.stage_01"

stage_01 = stage_01:new{}
stage_01:show()
