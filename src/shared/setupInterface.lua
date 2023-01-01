--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game:GetService("Players").LocalPlayer

--|| Packages ||--
local Roact = require(ReplicatedStorage.Packages.roact)
local Rodux = require(ReplicatedStorage.Packages.rodux)
local RoactRodux = require(ReplicatedStorage.Packages["roact-rodux"])

--|| Setup Interface ||--
local UI = ReplicatedStorage.Common.ui
local App = require(UI.App)

local function setupInterface(world, store)
    local app = Roact.createElement(RoactRodux.StoreProvider, {
        store = store
    }, {
        App = Roact.createElement(App)
    })
    Roact.mount(app, Player:WaitForChild("PlayerGui"))
end

return setupInterface