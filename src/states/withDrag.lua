local withdrag = {}
local player = {}
local ground = {}

-- define movement constants
local MAX_SPEED = 500 -- pixels/second
local GROUND_HEIGHT = 560

function withdrag:enter()

  -- Set stage background to something sky colored
  love.graphics.setBackgroundColor(131, 192, 240)

  width = love.graphics.getWidth()	-- get width of screen
  height = love.graphics.getHeight()	-- height, too.

  -- Create a player sprite.
  player.img = love.graphics.newImage('assets/player.png')  
  player.x = width / 2   -- This sets the player at the middle of the screen based on the width of the game window. 
  player.y = GROUND_HEIGHT  -- This sets the player at the middle of the screen based on the height of the game window. 
 
  -- Create some ground for the player to walk on
  ground.img = love.graphics.newImage('assets/ground.png')
  ground.img:setWrap('repeat','clamp') 
  ground.imgFrame = love.graphics.newQuad(0, 0, width, height, ground.img:getWidth(), ground.img:getHeight())	
  
end

function withdrag:draw()
  
  love.graphics.setBlendMode("alpha")
  
    -- This draws the player.
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
  
  -- This draws the ground.
  love.graphics.draw(ground.img, ground.imgFrame, 0, GROUND_HEIGHT)
  
end

-- The update() method is called every frame
function withdrag:update(dt)
  
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
  elseif love.keyboard.isDown('q') then
    
    Gamestate.switch(walkjump)
	end
  
end

return withdrag