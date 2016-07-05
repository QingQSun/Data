--TableView π”√
local TableView = class("TableView", require("app.views.Node"))

function TableView:onCreate()
    self:init()
end

function TableView:init(args)
    local winSize = cc.Director:getInstance():getWinSize()

    local tableView = cc.TableView:create(cc.size(600,200))
    tableView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    tableView:setPosition(cc.p(200, 200))
    tableView:setDelegate()
    self:addChild(tableView)
    --registerScriptHandler functions must be before the reloadData funtion
    tableView:registerScriptHandler(TableView.numberOfCellsInTableView,cc.NUMBER_OF_CELLS_IN_TABLEVIEW)  
    tableView:registerScriptHandler(TableView.scrollViewDidScroll,cc.SCROLLVIEW_SCRIPT_SCROLL)
    tableView:registerScriptHandler(TableView.scrollViewDidZoom,cc.SCROLLVIEW_SCRIPT_ZOOM)
    tableView:registerScriptHandler(TableView.tableCellTouched,cc.TABLECELL_TOUCHED)
    tableView:registerScriptHandler(TableView.cellSizeForTable,cc.TABLECELL_SIZE_FOR_INDEX)
    tableView:registerScriptHandler(TableView.tableCellAtIndex,cc.TABLECELL_SIZE_AT_INDEX)
    tableView:reloadData()

end

function TableView.numberOfCellsInTableView(table)
   return 25
end

function TableView.scrollViewDidScroll(view)
    print("scrollViewDidScroll")
end

function TableView.scrollViewDidZoom(view)
    print("scrollViewDidZoom")
end

function TableView.tableCellTouched(table,cell)
    print("cell touched at index: " .. cell:getIdx())
end

function TableView.cellSizeForTable(table,idx) 
    return 200, 200
end

function TableView.tableCellAtIndex(table, idx)
    local strValue = string.format("%d",idx)
    local cell = table:dequeueCell()
    local label = nil
    if nil == cell then
        cell = cc.TableViewCell:new()
        local sprite = cc.Sprite:create("123.png")
        sprite:setAnchorPoint(cc.p(0,0))
        sprite:setPosition(cc.p(0, 0))
        cell:addChild(sprite)

        label = cc.Label:createWithSystemFont(strValue, "Helvetica", 20.0)
        label:setPosition(cc.p(0,0))
        label:setAnchorPoint(cc.p(0,0))
        label:setTag(123)
        cell:addChild(label)
    else
        label = cell:getChildByTag(123)
        if nil ~= label then
            label:setString(strValue)
        end
    end

    return cell
end


return TableView
