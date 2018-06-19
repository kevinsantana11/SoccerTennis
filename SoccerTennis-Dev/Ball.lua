Ball = Class{}

function Ball:init(x, y, width, height)
	self.x  = x
	self.y = y
	self.width =  width
	self.height = height
	self.dx = 0
	self.dy = 0
end

function Ball:collide(object)
	    if self.x > object.x + object.width or object.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > object.y + object.height or object.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end


function Ball:update(dt, Player1, Player2, Floor, Net)
	--handle logic for sky
	self.x = self.x + self.dx * dt
	self.y = self.y + self.dy * dt
end

function Ball:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end




