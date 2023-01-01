--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

--|| Packages ||--
local Matter = require(ReplicatedStorage.Packages.matter)

--|| Modules ||--
local TestAction = require(ReplicatedStorage.Common.actions.TestAction)

--|| Input System ||--
function inputSystem(world, store)
    for _, input, gameProcessedEvent in Matter.useEvent(UserInputService, "InputBegan") do
        if gameProcessedEvent then continue end
        if input.KeyCode == Enum.KeyCode.R then
            print("Player pressed R!")
            store:dispatch(TestAction("R"))
        end
    end
end

return inputSystem