local singleshot = {}

player = {
	x = 100,
	y = 100,
	speed = 200,
	heat = 0,
	heatp = 0.1
}
bullets = { }

function singleshot:enter()
  love.graphics.setBackgroundColor(50, 75, 125)
end

function singleshot:draw()
  -- draw player:
	love.graphics.setColor(255, 255, 255, 224)
	love.graphics.circle('fill', player.x, player.y, 15, 8)
	-- draw bullets:
	love.graphics.setColor(255, 255, 255, 224)
	local i, o
	for i, o in ipairs(bullets) do
		love.graphics.circle('fill', o.x, o.y, 10, 8)
	end
end

function singleshot:update(dt)
  
  if love.keyboard.isDown('a') then player.x = player.x - dt * player.speed end
	if love.keyboard.isDown('d') then player.x = player.x + dt * player.speed end
	if love.keyboard.isDown('w') then player.y = player.y - dt * player.speed end
	if love.keyboard.isDown('s') then player.y = player.y + dt * player.speed end
	player.heat = math.max(0, player.heat - dt)
	if love.mouse.isDown(1) and player.heat <= 0 then
		local direction = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
		table.insert(bullets, {
			x = player.x,
			y = player.y,
			dir = direction,
			speed = 400
		})
		player.heat = player.heatp
	end
	-- update bullets:
	local i, o
	for i, o in ipairs(bullets) do
		o.x = o.x + math.cos(o.dir) * o.speed * dt
		o.y = o.y + math.sin(o.dir) * o.speed * dt
		if (o.x < -10) or (o.x > love.graphics.getWidth() + 10)
		or (o.y < -10) or (o.y > love.graphics.getHeight() + 10) then
			table.remove(bullets, i)
		end
	end
  if love.keyboard.isDown('q') then
    Gamestate.switch(bullets)
	end
end

return singleshot