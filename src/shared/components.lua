--|| Services ||--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--|| Libraries ||--
local Matter = require(ReplicatedStorage.Packages.matter)

--|| Constants ||--
local COMPONENT_NAMES = {
	"Model",
	"Transform",

	"Object",
	"Health",
	"Poison",
}

--|| Components ||--
local components = {}

for _, name in ipairs(COMPONENT_NAMES) do
	components[name] = Matter.component(name)
end

return components