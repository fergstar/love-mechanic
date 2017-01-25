local basicwalking = {}

function basicwalking:enter()

end

function basicwalking:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("hello basicwalking", 200, 200)
end

-- The update() method is called every frame
function basicwalking:update()
  
end

return basicwalking