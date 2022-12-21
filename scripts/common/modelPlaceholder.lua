--- Farmer: gameObject.lua
--- @author RedJaguar

local model = mjrequire "common/model"
local resource = mjrequire "common/resource"
local gameObject = mjrequire "common/gameObject"
local flora = mjrequire "common/flora"
--local worldHelper = mjrequire "common/worldHelper"

local mod = {
    loadOrder = 1,
}

function mod:onload(modelPlaceholder)

    local super_initRemaps = modelPlaceholder.initRemaps
    modelPlaceholder.initRemaps = function()
		super_initRemaps()

        modelPlaceholder.standardLengthPoleBranchRemaps = {}
        modelPlaceholder.shortPoleBranchRemaps = {}
        modelPlaceholder.longPoleBranchRemaps = {}
        modelPlaceholder.xlongPoleBranchRemaps = {}
    
        for i,baseKey in ipairs(flora.branchTypeBaseKeys) do
            local baseGameObjectTypeIndex = gameObject.types[baseKey .. "Branch"].index
            
            -- Make a slightly longer version of longPoleBranch. x2 instead of 2.5? Or maybe x1.5
            
            modelPlaceholder.standardLengthPoleBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("woodenPole_" .. baseKey)
            modelPlaceholder.longPoleBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("woodenPoleLong_" .. baseKey)
            modelPlaceholder.xlongPoleBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("woodenPoleXLong_" .. baseKey)
            modelPlaceholder.shortPoleBranchRemaps[baseGameObjectTypeIndex] = modelPlaceholder:getRemaps("woodenPoleShort_" .. baseKey)

        
        end

        modelPlaceholder:addModel("hayStack2", {
            { 
                key = "branch_1",
	            defaultModelName = "woodenPoleLong_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.longPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            { 
                key = "branch_2",
	            defaultModelName = "woodenPoleLong_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.longPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            { 
                key = "branch_3",
	            defaultModelName = "woodenPoleLong_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.longPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            { 
                key = "branch_4",
	            defaultModelName = "woodenPoleLong_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.longPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            { 
                key = "branch_5",
	            defaultModelName = "woodenPoleShort_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            { 
                key = "branch_6",
	            defaultModelName = "woodenPoleShort_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            { 
                key = "branch_7", 
	            defaultModelName = "woodenPoleShort_birch",
	            resourceTypeIndex = resource.types.branch.index,
	            placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return modelPlaceholder:getModelIndexForStandardRemaps(placeholderInfo, modelPlaceholder.shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
                end
            },
            --[[{ 
                key = "stack",
                defaultModelName = "hayStack2",
                offsetToWalkableHeight = true,
				rotateToWalkableRotation = true,
                --defaultModelShouldOverrideResourceObject = true,
                
            },--]]
            {
                key = "branch_store",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "log_store",
                offsetToStorageBoxWalkableHeight = true,
            },
            --[[{
                multiKeyBase = "flaxTwine",
	            multiCount = 10, 
                defaultModelName = "flaxTwineBinding",
                resourceTypeIndex = resource.types.flaxTwine.index,
                defaultModelShouldOverrideResourceObject = true,
            }--]]
        })
        
    end

end

return mod