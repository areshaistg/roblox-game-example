--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Packages ||--
local Roact = require(ReplicatedStorage.Packages.roact)
local RoactHooks = require(ReplicatedStorage.Packages["roact-hooks"])
local RoactSpring = require(ReplicatedStorage.Packages["roact-spring"])
local RoactRodux = require(ReplicatedStorage.Packages["roact-rodux"])

--|| Last Input Component ||--
function LastInput(props)
    local lastInput = props.lastInput or "None"

    print("rendered")

    return Roact.createElement("TextLabel", {
        AnchorPoint = Vector2.new(.5, .5),
        Position = UDim2.fromScale(.5, .85),
        Size = UDim2.fromScale(.3, .1),
        Text = "LastInput: " .. lastInput
    })
end

LastInput = RoactRodux.connect(
    function(state, props)
        return {
            lastInput = state.action.lastInput
        }
    end,
    function(dispatch)
        return {
            
        }
    end
)(LastInput)

return LastInput