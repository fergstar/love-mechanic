Menu = require 'menu'

Gamestate = require 'libs/hump/gamestate'
basicwalking = require 'src/states/basicwalking'
walkjump = require 'src/states/walkjump'
mainmenu = require 'src/states/mainmenu'

local aspect_ratio = require 'libs/aspect_ratio'
local canvas

fullscreen = false
playingAreaWidth = love.graphics.getWidth() 
playingAreaHeight = love.graphics.getHeight() 

function love.load(arg)
	
  if arg[#arg] == "-debug" then 
    require("mobdebug").start() 
  end
  
  Gamestate.registerEvents()
  Gamestate.switch(mainmenu)

end

function love.update(dt)

end

function love.draw()
  --love.graphics.setColor(35, 92, 118)
  --love.graphics.rectangle('fill', 220, 10, (playingAreaWidth - 230), (playingAreaHeight - 20))
  
end

function love.resize(w, h)
  
end