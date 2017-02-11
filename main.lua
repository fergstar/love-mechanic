Menu = require 'libs/menu'

Gamestate = require 'libs/hump/gamestate'

-- walking and jumping
basicwalking = require 'src/states/basicwalking'
withacceleration = require 'src/states/withAcceleration'
withdrag = require 'src/states/withDrag'
jumping = require 'src/states/jumping'
doublejump = require 'src/states/doublejump'
variablejumpheight = require 'src/states/variableJumpHeight'
walkjump = require 'src/states/walkjump'

-- bullets
bullets = require 'src/states/bullets'

mainmenu = require 'src/states/mainmenu'

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