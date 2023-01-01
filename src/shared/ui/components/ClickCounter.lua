--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Packages ||--
local Roact = require(ReplicatedStorage.Packages.roact)
local RoactHooks = require(ReplicatedStorage.Packages["roact-hooks"])
local RoactSpring = require(ReplicatedStorage.Packages["roact-spring"])

function ClickCounter(props, hooks)
    local styles, api = RoactSpring.useSpring(hooks, function()
        return { size = UDim2.fromScale(.15, .15) }
    end)

    local count, setCount = hooks.useState(0)
    hooks.useEffect(function()
        print("the count is", count)
        api.start({
            reset = true,
            from = { size = UDim2.fromScale(.15, .15) },
            to = { size = UDim2.new(.15, 15, .15, 15) },
            config = { duration = 0.2, easing = RoactSpring.easings.easeOutSine }
        }):andThen(function()
            api.start({
                to = { size = UDim2.fromScale(.15, .15) },
                config = { duration = 0.4, easing = RoactSpring.easings.easeInSine }
            })
        end)
    end)

    return Roact.createElement("TextButton", {
        Size = styles.size,
        AnchorPoint = Vector2.new(.5, .5),
        Position = UDim2.fromScale(.5, .5),
        Text = "count is: " .. tostring(count),

        [Roact.Event.Activated] = function()
            setCount(count + 1)
        end
    })
end

ClickCounter = RoactHooks.new(Roact)(ClickCounter)

return ClickCounter