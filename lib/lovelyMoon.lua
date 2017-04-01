lovelyMoon = {}

function lovelyMoon.update(dt)
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.update then
         local newState = state:update(dt)
         if newState then
            if state.close then
               state:close()
            end

            state = newState

            if state.load then
               state:load()
            end
         end
      end
   end
end

function lovelyMoon.draw()
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.draw then
         state:draw()
      end
   end
end

function lovelyMoon.keypressed(key)
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.keypressed then
         state:keypressed(key)
      end
   end
end

function lovelyMoon.keyhold(key)
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.keyhold then
         state:keyhold(key)
      end
   end
end

function lovelyMoon.keyreleased(key)
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.keyreleased then
         state:keyreleased(key)
      end
   end
end

function lovelyMoon.mousepressed(x, y, button)
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.mousepressed then
         state:mousepressed(x,y,button)
      end
   end
end

function lovelyMoon.mousereleased(x, y, button)
   for index, state in pairs(_slotState.states) do
      if state and state._enabled and state.mousereleased then
         state:mousereleased(x,y,button)
      end
   end
end