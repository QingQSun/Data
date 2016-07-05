--骨骼动画
local Spine = class("Spine", require("app.views.Node"))

function Spine:onCreate()
    self:init()
end

function Spine:init()
    local spineNode = sp.SkeletonAnimation:create("export/raptor.json", "export/raptor.atlas")
    self:addChild(spineNode)
    spineNode:setScale(0.5)
    spineNode:setAnimation(0, "Jump", true)
    

end

function Spine:testKeypad(event)
    print("event.name:"..event.name,"event.key:"..event.key)
end 

return Spine