class.DebugMode()

function DebugMode:load()
	-- Importa bibliotecas de debug
	lovebird = require("lib/lovebird")
	fpsGraph = require "lib/FPSGraph"

	-- Cria gráficos informativos
	Info1 = fpsGraph.createGraph(0, 60)
	Info2 = fpsGraph.createGraph(0, 90)
	Info3 = fpsGraph.createGraph(0, 120)
	fpsInfo = fpsGraph.createGraph()
	memoryInfo = fpsGraph.createGraph(0, 30)

	-- Informações no console
	print("Modo debug LIGADO")
	print("-----------------")
end

function DebugMode:close()
end

function DebugMode:enable()
end

function DebugMode:disable()
end

function DebugMode:update(dt)
	lovebird.update(dt)

	fpsGraph.updateFPS(fpsInfo, dt)
	fpsGraph.updateMem(memoryInfo, dt)
end

function DebugMode:draw()
	love.graphics.setColor(255, 0, 0, 255)
	fpsGraph.drawGraphs({fpsInfo})
	love.graphics.setColor(10, 200, 255, 255)
	fpsGraph.drawGraphs({memoryInfo})
	love.graphics.setColor(10, 10, 255, 255)
	fpsGraph.drawGraphs({Info1})
	love.graphics.setColor(200, 10, 255, 255)
	fpsGraph.drawGraphs({Info2})
	love.graphics.setColor(255, 255, 87, 255)
	fpsGraph.drawGraphs({Info3})
end
