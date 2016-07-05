
--ÊÂ¼þ
function cc.exports.eventDataDispatch(name, data) 
	local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
	local theEvent = cc.EventCustom:new(name)
	theEvent.bindData = data
	eventDispatcher:dispatchEvent(theEvent)
end 
