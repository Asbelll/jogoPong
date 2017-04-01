_slotState = { states = {} }

function addState(class, id, key)
   class._enabled = false
   class._id = id
   class:load()

   if (key ~= nil and _slotState.states[key] == nil) then
      _slotState.states[key] = class
   else
      table.insert(_slotState.states, class)
   end

   return state
end

function isStateEnabled(id)
   for index, state in pairs (_slotState.states) do
      if state._id == id then
         return state._enabled
      end
   end
end

function getState(id)
   for index, state in pairs (_slotState.states) do
      if state._id == id then
         return state
      end
   end
end

function enableState(id)
   for index, state in pairs (_slotState.states) do
      if state._id == id then
         state:enable()
         state._enabled = true
      end
   end
end

function disableState(id)
   for index, state in pairs (_slotState.states) do
      if state._id == id then
         state:disable()
         state._enabled = false
      end
   end
end

function toggleState(id)
   for index, state in pairs (_slotState.states) do
      if state._id == id then
         state._enabled = not state._enabled
         if state._enabled then
            state:enable()
         else
            state:disable()
         end
      end
   end
end

function destroyState(id)
   for index, state in pairs (_slotState.states) do
      if state._id == id then
         state:close()
         table.remove(_slotState.states, index)
      end
   end
end