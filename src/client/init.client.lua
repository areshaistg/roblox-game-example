--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local start = require(ReplicatedStorage.Common.start)
local setupScreen = require(ReplicatedStorage.Common.setupScreen)
local world, state = start({
    script.systems,
    ReplicatedStorage.Common.systems
})

setupScreen(world, state)