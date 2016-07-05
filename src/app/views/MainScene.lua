local MainScene = class("MainScene", require("app.views.Node"))

MainScene.RESOURCE_FILENAME = "main3DScene.csb"

local header = require("app.views.Header")

function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    
    --[[ you can create scene with following comment code instead of using csb file.
    -- add background image
    display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)

    -- add HelloWorld label
    cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)
    ]]

    local node = require("app.views.ProgressTime"):create()
    node:initWithSprite(cc.Sprite:create("0001.png"))
    node:setPercentage(100)
    node:setPosition(cc.p(480, 320))
    self:addChild(node)
    local num = 100
    local delay = cc.DelayTime:create(1 / 60)
    local call = cc.CallFunc:create(function()
        num = num - 0.1
        if num < 0 then
            self:stopAllActions()
            return
        end
        node:setPercentage(num)    
    end)
    self:runAction(cc.RepeatForever:create(cc.Sequence:create(delay, call)))

end

return MainScene
