Menu = require 'menu'

Gamestate = require 'libs/hump/gamestate'
walkjump = require 'src/states/walkjump'
mainmenu = require 'src/states/mainmenu'

fullscreen = false

function love.load()
	
  Gamestate.registerEvents()
  Gamestate.switch(mainmenu)
  
end

function love.update(dt)
	
end

function love.draw()
  
end