local bullets = {}

function bullets:enter()
  love.graphics.setBackgroundColor(0, 0, 0)
  
  menu = Menu
  menu:addItem{
    name = '1. Single Shot',
    action = function()
     Gamestate.switch(singleshot)
    end
  }
  menu:addItem{
    name = '2. Rapid Fire',
    action = function()
      Gamestate.switch(rapidfire)
    end
  }
  menu:addItem{
    name = '3. Aiming',
    action = function()
      Gamestate.switch(aiming)
    end
  }
  menu:addItem{
    name = '4. Artillery',
    action = function()
      --Gamestate.switch(artillery)
    end
  }
  menu:addItem{
    name = '5. Display trajectory',
    action = function()
      --Gamestate.switch(displaytrajectory)
    end
  }
  menu:addItem{
    name = '< Back',
    action = function()
      Gamestate.switch(mainmenu)
    end
  }
end

function bullets:draw()
  menu:draw(10,10)
end

function bullets:update(dt)
  menu:update(dt)
end

function bullets:keypressed(key)
 menu:keypressed(key)
end

function bullets:leave()
  menu:reset()
end

return bullets