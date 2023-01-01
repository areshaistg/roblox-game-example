--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Packages ||--
local Matter = require(ReplicatedStorage.Packages.matter)

--|| Modules ||--
local Components = require(ReplicatedStorage.Common.components)

local function setupObjects(world: Matter.World, state)
    for id in world:query(Components.Object):without(Components.Health) do
        world:insert(id, Components.Health({
            value = 100
        }))
    end
end

return setupObjects