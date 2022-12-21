--- Farmer: material.lua
--- @author RedJaguar

local mod = {
	loadOrder = 1
}

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local function mat(key, color, roughness, metal)
	return {key = key, color = color, roughness = roughness, metal = metal or 0.0}
end

function mod:onload(material)
	mj:insertIndexed(material.types, mat("wood", vec3(0, 0, 0.02), 1.0))
end

return mod