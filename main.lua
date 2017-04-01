-- Importa todos os states.
require("states/Debug") -- FIXME: Remover na versão final
require("states/StartSequence")

-- Importa módulos necessários.
require("modules/mInputVerify")

function love.load()
	-- Adiciona os game states para uso futuro.
	addState(StartSequence, "StartSequence")
	addState(DebugMode, "Debug", 10)

	-- Game state inicial.
	enableState("StartSequence")
	enableState("Debug")
end

function love.update(dt)
	InputVerify:update(dt)
	lovelyMoon.update(dt)
end

function love.draw()
	lovelyMoon.draw()
end

function love.keypressed(key)
	InputVerify:keypressed(key)
end

function love.keyreleased(key)
	InputVerify:keyreleased(key)
end

function love.mousepressed(x, y, button)
	lovelyMoon.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.mousereleased(x, y, button)
end
