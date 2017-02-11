local jumping = {}
local player = {}
local ground = {}
love.keyboard.keysPressed = { }
love.keyboard.keysReleased = { }

-- define movement constants
local MAX_SPEED = 500 -- pixels/second
local GROUND_HEIGHT = 560

function jumping:enter()

  -- Set stage background to something sky colored
  love.graphics.setBackgroundColor(66, 136, 204)
  

  width = love.graphics.getWidth()	-- get width of screen
  height = love.graphics.getHeight()	-- height, too.

  -- Create a player sprite.
  player.img = love.graphics.newImage('assets/player.png') 
  player.x = width / 2   -- This sets the player at the middle of the screen based on the width of the game window. 
  player.y = GROUND_HEIGHT -- This sets the player at the middle of the screen based on the height of the game window. 
 
  player.ground = player.y
  player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.
 
	player.jump_height = -500    -- Whenever the character jumps, he can reach this height.
	player.gravity = -800        -- Whenever the character falls, he will descend at this rate.
  player.jumping = false
  player.onTheGround = true
  player.jumps = 2

  -- Create some ground for the player to walk on
  ground.img = love.graphics.newImage('assets/ground.png')
  ground.img:setWrap('repeat','clamp') 
  ground.imgFrame = love.graphics.newQuad(0, 0, width, height, ground.img:getWidth(), ground.img:getHeight())	
  
end

function jumping:draw()
  love.graphics.setBlendMode("alpha")
  
  -- This draws the player.
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
  
  -- This draws the ground.
  love.graphics.draw(ground.img, ground.imgFrame, 0, GROUND_HEIGHT)

end

-- The update() method is called every frame
function jumping:update(dt)
  
   if (player.onTheGround) then
      player.jumps = 2
      player.jumping = false
   end
  
   if love.keyboard.isDown('right') then
		-- This makes sure that the character doesn't go pass the game window's right edge.
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (MAX_SPEED * dt)
		end
	elseif love.keyboard.isDown('left') then
		-- This makes sure that the character doesn't go pass the game window's left edge.
		if player.x > 0 then 
			player.x = player.x - (MAX_SPEED * dt)
		end
  end
  
  if love.keyboard.isDown('q') then    
    Gamestate.switch(walkjump)
	end
  
  -- If the player is touching the ground, let him have 2 jumps
  if (player.onTheGround) then
    player.jumps = 2
    player.jumping = false
  end
  
  -- Jump!
  if player.jumps > 0 and love.keyboard.wasPressed('up') then
    player.y_velocity = player.jump_height 
    player.jumping = true
    player.onTheGround = false
  end
  
  --if player.jumping then
  if player.y_velocity ~= 0 then
    player.y = player.y + player.y_velocity * dt                -- This makes the character ascend/jump.
		player.y_velocity = player.y_velocity - player.gravity * dt -- This applies the gravity to the character.
  end
  
  -- Reduce the number of available jumps if the jump input is released
  if player.jumping and love.keyboard.wasReleased('up') then
    player.jumps = player.jumps - 1
  end
  
    -- This is in charge of collision, making sure that the character lands on the ground.
  if player.y > player.ground then    -- The game checks if the player has jumped.
    player.y_velocity = 0       -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
    player.y = player.ground    -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
    player.onTheGround = true
    
  end

  love.keyboard.updateKeys()
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

return jumping