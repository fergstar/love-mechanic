local mainmenu = {}

function mainmenu:enter()
  love.graphics.setBackgroundColor(0, 0, 0)
 menu = Menu
	menu:addItem{
		name = '1. Walking & Jumping',
		action = function()
			Gamestate.switch(walkjump)
		end
	}
  menu:addItem {
    name = '2. Bullets',
    action = function()
      Gamestate.switch(bullets)
    end
  }
	menu:addItem{
		name = 'Fullscreen',
		action = function(self)
			if not fullscreen then
				if love.window.setMode(0, 0, {fullscreen=true}) then
					fullscreen = true
					self.name = 'Disable fullscreen'
				end
			else
				if love.window.setMode(1024, 600, {fullscreen=false}) then
					fullscreen = false
					self.name = 'Enable fullscreen'
				end
			end
		end
	}
	if fullscreen then
		menu.items[#menu.items].name = 'Disable fullscreen'
	else
		menu.items[#menu.items].name = 'Enable fullscreen'
	end
	menu:addItem{
		name = 'Quit',
		action = function()
			love.event.quit()
		end
	}
end

function mainmenu:draw()
  menu:draw(10, 10)

end

function mainmenu:update(dt)
  menu:update(dt)
end

function mainmenu:keypressed(key)
  menu:keypressed(key)
end

function mainmenu:leave()
  menu:reset()
end
return mainmenu