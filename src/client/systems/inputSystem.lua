--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

--|| Packages ||--
local Matter = require(ReplicatedStorage.Packages.matter)

--|| Input System ||--
function inputSystem(world, state)
    for _, input, gameProcessedEvent in Matter.useEvent(UserInputService, "InputBegan") do
        if gameProcessedEvent then continue end
        if input.KeyCode == Enum.KeyCode.R then
            print("Player pressed R!")
        end
    end
end

return inputSystem