--|| Services ||--
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Modules ||--
local Components = require(ReplicatedStorage.Common.components)

local boundTags = {
    -- TagName = Components.ComponentName
    Object = Components.Object
}

local function setupTags(world)
    local function spawnBound(instance, component)
        if not instance:IsA("Model") then
            warn("Instance has tag but is not a model", instance)
            return
        end

        local id = world:spawn(
            component(),
            Components.Model({
                model = instance,
            }),
            Components.Transform({
                cframe = instance.PrimaryPart.CFrame
            })
        )

        instance:SetAttribute("serverEntityId", id)
    end

    for tagName, component in pairs(boundTags) do
        for _, instance in ipairs(CollectionService:GetTagged(tagName)) do
            spawnBound(instance, component)
        end

        CollectionService:GetInstanceAddedSignal(tagName):Connect(function(instance)
            spawnBound(instance, component)
        end)

        CollectionService:GetInstanceRemovedSignal(tagName):Connect(function(instance)
            local id = instance:GetAttribute("serverEntityId")
            if id then
                world:despawn(id)
            end
        end)
    end
end

return setupTags