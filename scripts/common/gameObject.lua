--- Farmer: gameObject.lua
--- @author RedJaguar

local typeMaps = mjrequire "common/typeMaps"
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local resource = mjrequire "common/resource"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

function mod:onload(gameObject)

	gameObject:addGameObject("hayStack", {

		name = "Hay Stack",
        modelName = "hayStack2",
		scale = 1.0,
		ignoreBuildRay = true,
		hasPhysics = true,
		isBuiltObject = true,
		isPathFindingCollider = true,
		sapienLookAtOffset = vec3(0.0,mj:mToP(0.5),0.0),
		markerPositions = {
			{ 
				worldOffset = vec3(0.0, mj:mToP(0.8), 0.0)
			}
		},
    })

	gameObject:addGameObject("build_hayStack", {
    	
		modelName = "hayStack2",
		scale = 1.0,
		hasPhysics = true,
		isInProgressBuildObject = true,
		ignoreBuildRay = true,
		objectViewCameraOffsetFunction = function(object)
			return vec3(0.0,0.5,1.0)
		end,
		markerPositions = {
			{ 
				worldOffset = vec3(0.0, mj:mToP(0.8), 0.0)
			}
		},

    })
end

return mod
