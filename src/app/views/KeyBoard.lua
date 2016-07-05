--键盘响应事件
local KeyBoard = class("KeyBoard", require("app.views.Node"))

function KeyBoard:onCreate()
    self:init()
end

function KeyBoard:init()
    local dispatcher = cc.Director:getInstance():getEventDispatcher()
    local keyboardListener = cc.EventListenerKeyboard:create()

    keyboardListener:registerScriptHandler(function(keyCode, event)
        dump(keyCode)
    end, cc.Handler.EVENT_KEYBOARD_PRESSED)

    keyboardListener:registerScriptHandler(function(keyCode, event)
        dump(keyCode)
    end, cc.Handler.EVENT_KEYBOARD_RELEASED)

     dispatcher:addEventListenerWithSceneGraphPriority(keyboardListener, self);
end

return KeyBoard