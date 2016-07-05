--´¥Ãþ²ã
local TouchLayer = class("TouchLayer", require("app.views.Node"))

function TouchLayer:onCreate()
    self:init()
end

function TouchLayer:init()
    local winSize = cc.Director:getInstance():getWinSize()

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(function(touch, event)
        return self:onTouchBegan(touch, event)
    end, cc.Handler.EVENT_TOUCH_BEGAN)

    listener:registerScriptHandler(function(touch, event)
        self:onTouchMoved(touch, event)
    end, cc.Handler.EVENT_TOUCH_MOVED)

    listener:registerScriptHandler(function(touch, event)
        self:onTouchEnded(touch, event)
    end, cc.Handler.EVENT_TOUCH_ENDED)

    listener:registerScriptHandler(function(touch, event)
        self:onTouchCanCelled(touch, event)
    end, cc.Handler.EVENT_TOUCH_CANCELLED)

    local eventDispatcher = self:getEventDispatcher()    
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)

end

function TouchLayer:onTouchBegan(touch, event)
    if self.beganEvent then
        return self.beganEvent(touch, event)
    end
end

function TouchLayer:onTouchMoved(touch, event)
    if self.movedEvent then
        return self.movedEvent(touch, event)
    end
end

function TouchLayer:onTouchEnded(touch, event)
    if self.endedEvent then
        return self.endedEvent(touch, event)
    end
end

function TouchLayer:onTouchCanCelled(touch, event)
    if self.cancelledEvent then
        return self.cancelledEvent(touch, event)
    end
end

function TouchLayer:setTouchEvent(beganEvent, movedEvent, endedEvent, cancelledEvent)
    self.beganEvent = beganEvent
    self.movedEvent = movedEvent
    self.endedEvent = endedEvent
    self.cancelledEvent = cancelledEvent
end


return TouchLayer