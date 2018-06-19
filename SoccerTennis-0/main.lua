WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


function love.load()
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen  = false,
		resizable = false,
		vsync = true
		})
end

function love.draw()
	love.graphics.printf(
		'Hello Soccer Tennis',
		0,
		5,
		WINDOW_WIDTH,
		'center')
end