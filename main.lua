Menu = require 'menu'
Gamestate = require 'libs/hump/gamestate'

local menustate = {}
local walkjumpstate = {}
local gamestate = {}

fullscreen = false

function menustate:enter()
 mainmenu = Menu
	mainmenu:addItem{
		name = '1. Walking & Jumping',
		action = function()
			Gamestate.switch(walkjumpstate)
		end
	}
	mainmenu:addItem{
		name = 'Fullscreen',
		action = function(self)
			if not fullscreen then
				if love.window.setMode(0, 0, {fullscreen=true}) then
					fullscreen = true
					self.name = 'Disable fullscreen'
				end
			else
				if love.window.setMode(800, 600, {fullscreen=false}) then
					fullscreen = false
					self.name = 'Enable fullscreen'
				end
			end
		end
	}
	if fullscreen then
		mainmenu.items[#mainmenu.items].name = 'Disable fullscreen'
	else
		mainmenu.items[#mainmenu.items].name = 'Enable fullscreen'
	end
	mainmenu:addItem{
		name = 'Quit',
		action = function()
			love.event.quit()
		end
	}
end

function menustate:draw()
  mainmenu:draw(10, 10)
end

function menustate:update(dt)
  mainmenu:update(dt)
end

function menustate:keypressed(key)
  mainmenu:keypressed(key)
end

function menustate:leave()
  mainmenu:reset()
end

function walkjumpstate:enter()
  walkjumpmenu = Menu
  walkjumpmenu:addItem{
    name = '1. Test',
    action = function()
      -- do something
    end
  }
  walkjumpmenu:addItem{
    name = '< Back',
    action = function()
      Gamestate.switch(menustate)
    end
  }
end

function walkjumpstate:draw()
  walkjumpmenu:draw(10,10)
end

function walkjumpstate:update(dt)
  walkjumpmenu:update(dt)
end

function walkjumpstate:keypressed(key)
 walkjumpmenu:keypressed(key)
end

function walkjumpstate:leave()
  walkjumpmenu:reset()
end

function love.load()
	
  Gamestate.registerEvents()
  Gamestate.switch(menustate)
  
end

function love.update(dt)
	
end

function love.draw()
  
end