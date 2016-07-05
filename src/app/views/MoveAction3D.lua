--3D动画效果
local MoveAction3D = class("MoveAction3D", require("app.views.Node"))

function MoveAction3D:onCreate()
    self.m_min_x = 400
    self.m_max_x = 560

    self:init()
end

function MoveAction3D:init()
    local layer = require("app.views.TouchLayer"):create()
    self:addChild(layer)
    
    self:addImage()

    layer:setTouchEvent(
    function(touch, event)
        return self:TouchBegan(touch, event)
    end, 
    function(touch, event)
        self:TouchMoved(touch, event)
    end,
    function(touch, event)
        self:TouchEnded(touch, event)
    end,
    function(touch, event)
        self:TouchCancel(touch, event)
    end)
end

--触摸开始
function MoveAction3D:TouchBegan(touch, event)
    self.m_baganPoint = touch:getLocation()    
    return true
end

--触摸中
function MoveAction3D:TouchMoved(touch, event)
    self.m_movedPoint = touch:getLocation()
    local difPoint = cc.p(self.m_movedPoint.x - self.m_baganPoint.x, self.m_movedPoint.y - self.m_baganPoint.y)
    
    for i = 1, #self.m_image do
        local x = self.m_image[i]:getPositionX()
        self:setImageInfo(self.m_image[i], x)            
        self.m_image[i]:setPosition({x = self:getPosition(x, difPoint.x, self.m_image[i]:getRotation3D().y), y = self.m_image[1]:getPositionY()})
    end
    self.m_baganPoint = self.m_movedPoint
end

--设置图片属性
function MoveAction3D:setImageInfo(image, x)
    image:setRotation3D({y = self:getRotation3D(x)})
    image:setOpacity(self:getOpacity(x))
    image:setLocalZOrder(self:getOpacity(x))
end

--触摸结束
function MoveAction3D:TouchEnded(touch, event)
    local info = {}
     for i = 1, #self.m_image do
        local x = self.m_image[i]:getPositionX()
        info[i] = x
    end
end

--触摸溢出
function MoveAction3D:TouchCancel(touch, event)

end

--添加图片
function MoveAction3D:addImage()
    self.m_image = {}
    for i = 1, 10 do
        self.m_image[i] = ccui.ImageView:create("0001.png")
        self.m_image[i]:setPosition(cc.p(display.width / 2 + 250 * (i - 1), display.height / 2))
        self:setImageInfo(self.m_image[i], self.m_image[i]:getPositionX())
        self:addChild(self.m_image[i])

        local text = ccui.Text:create()
    end
end

--获得旋转角度
function MoveAction3D:getRotation3D(x)
    if x < self.m_min_x then
        local y_r = self.m_min_x - x
        if y_r >= 90 then
            y_r = 90
        end
        return y_r
    elseif x > self.m_max_x then
        local y_r = self.m_max_x - x
        if y_r <= -90 then
            y_r = -90
        end
        return y_r
    else
        return 0
    end
end

--获得移动位置
function MoveAction3D:getPosition(x, d_x, r)
    if x < self.m_min_x then
        x = x + d_x * 1
        return x
    elseif x > self.m_max_x then
        x = x + d_x * 1
        return x
    else
        x = x + d_x * 1
        return x
    end
end

--获得透明度
function MoveAction3D:getOpacity(x)
    if x < self.m_min_x then
        local o = 255 - math.modf((self.m_min_x - x) * 0.1)
        if o < 0 then
            o = 0
        end
        return o
    elseif x > self.m_max_x then
        local o = 255 - math.modf((x - self.m_max_x) * 0.1)
        if o < 0 then
            o = 0
        end
        return o
    else
        return 255
    end
end

return MoveAction3D
