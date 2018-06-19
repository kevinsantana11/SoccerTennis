push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()

	love.graphics.setDefaultFilter('nearest', 'nearest')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT,  WINDOW_WIDTH,  WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
		})
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
	push:apply('start')

	love.graphics.printf(
		'Hello Soccer Tennis',
		0,
		5,
		VIRTUAL_WIDTH,
		'center')
	selfDefined()
	push:apply('end')
end