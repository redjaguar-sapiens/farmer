--- Farmer: buildUI.lua
--- @author RedJaguar

local constructable = mjrequire "common/constructable"

local mod = {
    loadOrder = 1,
}

function mod:onload(buildUI)
    
    local super_createItemList = buildUI.createItemList
    buildUI.createItemList = function()

        super_createItemList(buildUI)
        table.insert(buildUI.itemList, constructable.types.hayStack.index)
        
    end
    
end

return mod