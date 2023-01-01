--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Packages ||--
local Packages = ReplicatedStorage.Packages
local Rodux = require(Packages.rodux)

return Rodux.makeActionCreator("TestAction", function(input)
    return {
        input = input
    }
end)