push = require 'push'
KeyboardInput = require 'KeyboardInput'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()

	love.graphics.setDefaultFilter('nearest', 'nearest')

	smallFont  = love.graphics.newFont('font.ttf', 8)

	love.graphics.setFont(smallFont)

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT,  WINDOW_WIDTH,  WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
		})
end

function love.update(df)
	KeyboardInput:keyboardAction()
end

function love.draw()
	push:apply('start')

	drawGameObjects()
	push:apply('end')
end

function drawGameObjects()
		love.graphics.printf('Hello Soccer Tennis', 0, 5, VIRTUAL_WIDTH, 'center')
	--this is for the left player aka player 1
	love.graphics.rectangle('fill', 10, VIRTUAL_HEIGHT - 30, 10, 10)
	--this is for the right player aka player 2 
	love.graphics.rectangle('fill', VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 30, 10, 10)
	--this is the rectangle field they will play on
	love.graphics.rectangle('fill', 5, VIRTUAL_HEIGHT - 10, 420, 10)
	--this will be the net
	love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 10, VIRTUAL_HEIGHT - 40, 10, 30)
	--this will be the ball
	love.graphics.rectangle('fill', VIRTUAL_WIDTH/ 2 - 5, VIRTUAL_HEIGHT  / 2 - 5 + 50, 5 ,5)
end
