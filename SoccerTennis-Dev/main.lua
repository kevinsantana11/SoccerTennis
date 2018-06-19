push = require 'push'
KeyboardInput = require 'KeyboardInput'
Class = require 'class'
require 'Player'
require 'Ball'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
	objects =  {}

  	love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  	world = love.physics.newWorld(0, 9.81*64, true) 

	love.graphics.setDefaultFilter('nearest', 'nearest')

	smallFont  = love.graphics.newFont('font.ttf', 8)

	love.graphics.setFont(smallFont)

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT,  WINDOW_WIDTH,  WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
		})

	Player1 = Player(10, VIRTUAL_HEIGHT  - 30, 10, 10)
	Player2 = Player(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 10, 10)
	Ball = Ball(VIRTUAL_WIDTH / 2 - 5, VIRTUAL_HEIGHT / 2 - 5 + 50, 5, 5)
	Ball.dx = math.random(140,200)
	Ball.dy = math.random(50, 150)


end

function love.update(dt)
	world:update(dt) 
	KeyboardInput:keyboardAction()

	if love.keyboard.isDown('a') then
		Player1.dx = -PADDLE_SPEED
	elseif love.keyboard.isDown('d') then
		Player1.dx  = PADDLE_SPEED
	else
		Player1.dx = 0
	end

	if love.keyboard.isDown('left') then
		Player2.dx = -PADDLE_SPEED 
	elseif love.keyboard.isDown('right') then
		Player2.dx = PADDLE_SPEED
	else
		Player2.dx = 0
	end

	if Ball:collide(Player1) then
		Ball.dx = -Ball.dx * 1.03
		Ball.x = Player1.x + 5

		if Ball.dy < 0 then
			Ball.dy = -math.random(10, 50)
		else
			Ball.dy = math.random(10,50)
		end
	end

	if Ball:collide(Player2) then
		Ball.dx = -Ball.dx * 1.03
		Ball.x = Player1.x - 4

		if Ball.dy < 0 then
			Ball.dy = -math.random(10, 50)
		else
			Ball.dy = math.random(10,50)
		end
	end

	if Ball.y <= 0 then
		Ball.y = 0
		Ball.dy = -Ball.dy
	end

	if Ball.y >= VIRTUAL_HEIGHT - 4 then
		Ball.y = VIRTUAL_HEIGHT - 4
		Ball.dy = -Ball.dy
	end

	if Ball.x <= 0 then
		Ball.x = 0
		Ball.dx = -Ball.dx
	end

	if Ball.x >= VIRTUAL_WIDTH - 4 then
		Ball.x = VIRTUAL_WIDTH - 4
		Ball.dx = -Ball.dx
	end


	Ball:update(dt)
	Player1:Update(dt)
	Player2:Update(dt)

end

function love.draw()
	push:apply('start')

	Player1:render()
	Player2:render()
	Ball:render()

	love.graphics.printf('Hello Soccer Tennis', 0, 5, VIRTUAL_WIDTH, 'center')
	--this is the rectangle field they will play on
	love.graphics.rectangle('fill', 5, VIRTUAL_HEIGHT - 10, 420, 10)
	--this will be the net
	love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 10, VIRTUAL_HEIGHT - 40, 10, 30)
	
	push:apply('end')
end