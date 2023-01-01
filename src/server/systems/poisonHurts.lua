--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Libraries ||--
local Components = require(ReplicatedStorage.Common.components)

--|| Poison Hurts ||--
local function poisonHurts(world)
    for id, health in world:query(Components.Health, Components.Poison) do
        world:insert(id, health:patch({
            value = health.value - 0.1
        }))
    end
end

return poisonHurts