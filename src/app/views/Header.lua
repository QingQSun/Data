local Header = class("Header")

function Header:seeNodeByTag(node, iTag)
    if node == nil then 
        return nil
    end

    if node:getTag() == iTag then
        return node
    end

    local arryRootChild = node:getChildren()
    local length = #arryRootChild
    for i = 1, length do
        local child = arryRootChild[i]
        if child ~= nil then
            local res = self:seeNodeByTag(child, iTag)
            if res ~= nil then
                return res
            end
        end
    end
    return nil
end

function Header:seeNodeByName(node, name)
    if node == nil then 
        return nil
    end

    if node:getName() == name then
        return node
    end

    local arryRootChild = node:getChildren()
    local length = #arryRootChild
    for i = 1, length do
        local child = arryRootChild[i]
        if child ~= nil then
            local res = self:seeNodeByName(child, name)
            if res ~= nil then
                return res
            end
        end
    end
    return nil
end


return Header