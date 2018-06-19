local KeyboardInput = {}

--setmetatable(KeyboardInput, {})

function keyboardAction()
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end

return KeyboardInput
