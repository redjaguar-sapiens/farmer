--- Farmer: buildable.lua
--- @author RedJaguar

local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"
--local order = mjrequire "common/order"
local snapGroup = mjrequire "common/snapGroup"
local skill = mjrequire "common/skill"
local plan = mjrequire "common/plan"
local action = mjrequire "common/action"
local actionSequence = mjrequire "common/actionSequence"

local constructable = mjrequire "common/constructable"

local mod = {
    loadOrder = 1,
}

local clearObjectsAndTerrainSequence = {
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearTerrain.index
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.bringResources.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.bringTools.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.moveComponents.index,
    },
}

function mod:onload(buildable)

    buildable:addBuildable("hayStack", {
        modelName = "hayStack2",
        inProgressGameObjectTypeKey = "build_hayStack",
        finalGameObjectTypeKey = "hayStack",
        name = "Hay Stack",
        plural = "Hay Stacks",
        summary = "Stacks hay",
        buildCompletionPlanIndex = plan.types.light.index,
        classification = constructable.classifications.build.index,
        
        noBuildUnderWater = true,
        allowYTranslation = true,
		allowXZRotation = true,
        allowBuildEvenWhenDark = true,

        skills = {
            required = skill.types.basicBuilding.index,
        },
        
        requiredResources = {
            {
                type = resource.types.branch.index,
                count = 7,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                }
            }
            --[[,
            {
                type = resource.types.flaxTwine.index,
                count = 2,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                }
            }--]]
        },
    
        --placeBuildObjectsInFinalLocationsOnDropOff = true,
    
        buildSequence = clearObjectsAndTerrainSequence,
    
    })
    

    --[[
        Decorations
        - Ladder

        Crops
        - Rice (shallow water)
        - For now: upland rice: https://en.wikipedia.org/wiki/Upland_rice
        - Lentils
        - Chickpeas
        - Barley
        - Rye
    ]]

end

return mod