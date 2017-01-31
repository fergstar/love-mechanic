local jumping = {}
local player = {}
local ground = {}

-- define movement constants
local MAX_SPEED = 500 -- pixels/second
local GROUND_HEIGHT = 560

function jumping:enter()

  -- Set stage background to something sky colored
  love.graphics.setBackgroundColor(131, 192, 240)

  width = love.graphics.getWidth()	-- get width of screen
  height = love.graphics.getHeight()	-- height, too.

  -- Create a player sprite.
  player.img = love.graphics.newImage('assets/player.png') 
  player.x = width / 2   -- This sets the player at the middle of the screen based on the width of the game window. 
  player.y = GROUND_HEIGHT  -- This sets the player at the middle of the screen based on the height of the game window. 
 
  player.ground = player.y
  player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.
 
	player.jump_height = -500    -- Whenever the character jumps, he can reach this height.
	player.gravity = -800        -- Whenever the character falls, he will descend at this rate.
  

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
  
  -- This is in charge of player jumping.
	if love.keyboard.isDown('up') then                     -- Whenever the player presses or holds down the Spacebar:
    -- The game checks if the player is on the ground. Remember that when the player is on the ground, Y-Axis Velocity = 0.
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height    -- The player's Y-Axis Velocity is set to it's Jump Height.
		end
	end
  
  -- This is in charge of the jump physics.
  if player.y_velocity ~= 0 then                                      -- The game checks if player has "jumped" and left the ground.
		player.y = player.y + player.y_velocity * dt                -- This makes the character ascend/jump.
		player.y_velocity = player.y_velocity - player.gravity * dt -- This applies the gravity to the character.
	end
 
  -- This is in charge of collision, making sure that the character lands on the ground.
  if player.y > player.ground then    -- The game checks if the player has jumped.
    player.y_velocity = 0       -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
    player.y = player.ground    -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
  end
  
end

return jumping