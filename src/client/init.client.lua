--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local start = require(ReplicatedStorage.Common.start)
local setupInterface = require(ReplicatedStorage.Common.setupInterface)
local world, state = start({
    script.systems,
    ReplicatedStorage.Common.systems
})

setupInterface(world, state)