-- Transforma todos os comandos de entrada do love em comandos válidos para a engine

class.InputVerify()

commandList = {}
holdingKeys = {}

function InputVerify:keypressed(key)
	if commandList[key] ~= nil then
		holdingKeys[key] = commandList[key]
		lovelyMoon.keypressed(commandList[key])
	end
end

function InputVerify:keyreleased(key)
	if commandList[key] ~= nil then
		holdingKeys[key] = nil
		lovelyMoon.keyreleased(commandList[key])
	end
end

function InputVerify:update(key)
	for key, command in pairs(holdingKeys) do
		lovelyMoon.keyhold(command)
	end
end
