--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game:GetService("Players").LocalPlayer

--|| Packages ||--
local Roact = require(ReplicatedStorage.Packages.roact)
local RoactHooks = require(ReplicatedStorage.Packages["roact-hooks"])

--|| Setup Screen ||--
local UI = ReplicatedStorage.Common.ui
local App = require(UI.App)

local function setupScreen(world, state)
    local app = Roact.createElement(App)
    Roact.mount(app, Player:WaitForChild("PlayerGui"))
end

return setupScreen