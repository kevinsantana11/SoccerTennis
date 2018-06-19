local KeyboardInput = {}

setmetatable(KeyboardInput, {})

function KeyboardInput:keyboardAction()
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
	return self;
end

return KeyboardInput

