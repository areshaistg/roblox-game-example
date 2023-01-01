--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Packages ||--
local Packages = ReplicatedStorage.Packages
local Rodux = require(Packages.rodux)

--|| Modules ||--
local start = require(ReplicatedStorage.Common.start)
local setupInterface = require(ReplicatedStorage.Common.setupInterface)

local TestAction = require(ReplicatedStorage.Common.actions.TestAction)
local testActionReducer = Rodux.createReducer({}, {
    [TestAction.name] = function(state, action)
        print("action lol")
        print(action.input)

        return { lastInput = action.input }
    end
})

local reducers = {
    -- gameState = gameStateReducer
    action = testActionReducer
}

local world, store = start({
    script.systems,
    ReplicatedStorage.Common.systems
}, reducers)

setupInterface(world, store)