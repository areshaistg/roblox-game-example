--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local start = require(ReplicatedStorage.Common.start)
local setupTags = require(ReplicatedStorage.Common.setupTags)

local world = start({
    script.systems,
    ReplicatedStorage.Common.systems
})

setupTags(world)