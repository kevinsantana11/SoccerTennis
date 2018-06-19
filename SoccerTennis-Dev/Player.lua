Player = Class{}

function Player:init( x, y, width, height)
	self.dx = dx
	self.x = x
	self.y  = y
	self.width = width
	self.height = height
end


function Player:Update(dt)
	if self['dx'] < 0 then
		self['x']  = math.max(0, self['x'] + self['dx'] * dt)
	else
		self['x'] = math.min(VIRTUAL_WIDTH  - self['width'], self['x'] + self['dx'] * dt)
	end	
end

function Player:render()
	love.graphics.rectangle('fill', self['x'], self['y'], self['width'], self['height'])
end

