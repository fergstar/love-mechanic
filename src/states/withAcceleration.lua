local withacceleration = {}
local player = {}
local ground = {}
love.keyboard.keysPressed = { }
love.keyboard.keysReleased = { }

-- define movement constants
local MAX_SPEED = 500 -- pixels/second
local ACCELERATION = 1500
local GROUND_HEIGHT = 560

local speed = 0

function withacceleration:enter()

  -- Set stage background to something sky colored
  love.graphics.setBackgroundColor(66, 136, 204)

  width = love.graphics.getWidth()	-- get width of screen
  height = love.graphics.getHeight()	-- height, too.

  -- Create a player sprite.
  player.img = love.graphics.newImage('assets/player.png')  
  player.x = width / 2   -- This sets the player at the middle of the screen based on the width of the game window. 
  player.y = GROUND_HEIGHT -- This sets the player at the middle of the screen based on the height of the game window. 
 
  -- Create some ground for the player to walk on
  ground.img = love.graphics.newImage('assets/ground.png')
  ground.img:setWrap('repeat','clamp') 
  ground.imgFrame = love.graphics.newQuad(0, 0, width, height, ground.img:getWidth(), ground.img:getHeight())	
  
end

function withacceleration:draw()
  love.graphics.setBlendMode("alpha")
  
    -- This draws the player.
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
  
  -- This draws the ground.
  love.graphics.draw(ground.img, ground.imgFrame, 0, GROUND_HEIGHT)
  
  trace.draw(300, 10)
  
end

-- The update() method is called every frame
function withacceleration:update(dt)
  
  if love.keyboard.isDown('right') then
		-- This makes sure that the character doesn't go pass the game window's right edge.
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
      speed = MAX_SPEED + (ACCELERATION * dt)
			player.x = player.x + (speed * dt)
		end
	elseif love.keyboard.isDown('left') then
		-- This makes sure that the character doesn't go pass the game window's left edge.
		if player.x > 0 then 
      speed = MAX_SPEED + (ACCELERATION * dt)
			player.x = player.x - (speed * dt)
		end
  else
    speed = 0
    
  end
  if love.keyboard.isDown('q') then
    
    Gamestate.switch(walkjump)
    
	end
  --trace.print('speed: ' .. tostring(speed), trace.styles.white)
end

-- returns if specified key was pressed since the last update
function love.keyboard.wasPressed(key)
	if (love.keyboard.keysPressed[key]) then
		return true
	else
		return false
	end
end
-- returns if specified key was released since last update
function love.keyboard.wasReleased(key)
	if (love.keyboard.keysReleased[key]) then
		return true
	else
		return false
	end
end
-- concatenate this to existing love.keypressed callback, if any
function love.keypressed(key, unicode)
	love.keyboard.keysPressed[key] = true
end
-- concatenate this to existing love.keyreleased callback, if any
function love.keyreleased(key)
	love.keyboard.keysReleased[key] = true
end
-- call in end of each love.update to reset lists of pressed\released keys
function love.keyboard.updateKeys()
	love.keyboard.keysPressed = { }
	love.keyboard.keysReleased = { }
end

return withacceleration