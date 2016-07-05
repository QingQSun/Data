local ProgressTime = class("ProgressTime", require("app.views.Node"))


function ProgressTime:onCreate()
    
end

function ProgressTime:initWithSprite(spr)
    self.m_ProgressTime = cc.ProgressTimer:create(spr)
    self.m_ProgressTime:setType(0)
    self.m_ProgressTime:setType(0)
    self.m_ProgressTime:setReverseDirection(true)
    self:addChild(self.m_ProgressTime)
end

function ProgressTime:setPercentage(age)
    self.m_ProgressTime:setPercentage(age)
end


return ProgressTime