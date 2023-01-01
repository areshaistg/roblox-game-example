--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Packages ||--
local Roact = require(ReplicatedStorage.Packages.roact)
local RoactHooks = require(ReplicatedStorage.Packages["roact-hooks"])
local RoactSpring = require(ReplicatedStorage.Packages["roact-spring"])

--|| Components ||--
local Components = script.Parent.components
local LastInput = require(Components.LastInput)
local ClickCounter = require(Components.ClickCounter)

--|| App ||--
local function App(props, hooks)
    return Roact.createElement("ScreenGui", {
        IgnoreGuiInset = true
    }, {
        -- Text = Roact.createElement(ClickCounter),
        Text = Roact.createElement(LastInput),
    })
end

App = RoactHooks.new(Roact)(App)

return App