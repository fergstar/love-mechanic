local walkjump = {}

function walkjump:enter()
  love.graphics.setBackgroundColor(0, 0, 0)
  
  menu = Menu
  menu:addItem{
    name = '1. Basic Walking',
    action = function()
     Gamestate.switch(basicwalking)
    end
  }
  menu:addItem{
    name = '2. With acceleration',
    action = function()
      Gamestate.switch(withacceleration)
    end
  }
  menu:addItem{
    name = '3. With drag',
    action = function()
      Gamestate.switch(withdrag)
    end
  }
  menu:addItem{
    name = '4. Jumping',
    action = function()
      Gamestate.switch(jumping)
    end
  }
  menu:addItem{
    name = '5. Double jump',
    action = function()
      Gamestate.switch(doublejump)
    end
  }
  menu:addItem{
    name = '6. Variable jump height',
    action = function()
      Gamestate.switch(variablejumpheight)
    end
  }
  menu:addItem{
    name = '< Back',
    action = function()
      Gamestate.switch(mainmenu)
    end
  }
end

function walkjump:draw()
  menu:draw(10,10)
end

function walkjump:update(dt)
  menu:update(dt)
end

function walkjump:keypressed(key)
 menu:keypressed(key)
end

function walkjump:leave()
  menu:reset()
end

return walkjump