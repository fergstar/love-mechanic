local menu = {}

menu.items = {}
menu.selected = 1
menu.animOffset = 0

function menu.addItem(self, item)
  table.insert(self.items, item)
end

function menu.update(self, dt)
  self.animOffset = self.animOffset / (1 + dt*10)
end 

function menu.draw(self, x, y)
	local height = 20
  local width = 200
  
  love.graphics.setColor(255, 255, 255, 128)
  love.graphics.rectangle('fill', x, y + height*(self.selected-1) + (self.animOffset * height), width, height)
  
  for i, item in ipairs(self.items) do
    if self.selected == i then
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(255, 255, 255, 128)
    end
    love.graphics.print(item.name, x + 5, y + height*(i-1) + 5)
  end
end

function menu.keypressed(self, key)
  
    if key == 'up' then
      if self.selected > 1 then
        self.selected = self.selected - 1
        self.animOffset = self.animOffset + 1
      else
        self.selected = #self.items
        self.animOffset = self.animOffset - (#self.items-1)
      end
    elseif key == 'down' then
      if self.selected < #self.items then
        self.selected = self.selected + 1
        self.animOffset = self.animOffset - 1
      else
        self.selected = 1
        self.animOffset = self.animOffset + (#self.items-1)
      end
    elseif key == 'return' then
      if self.items[self.selected].action then
        self.items[self.selected]:action()
      end
    end
  
end


function menu.reset()
  menu.items = {}
end

return menu 