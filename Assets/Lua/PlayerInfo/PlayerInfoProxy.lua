--Proxy继承了Notifer接口，可以发送命令SendNotification(),
--但不监听任何命令。
PlayerInfoProxy = class('PlayerInfoProxy', PureMVC.Proxy)
PlayerInfoProxy.CMD_REFRESH = 'PlayerInfoProxy'
local module = PlayerInfoProxy

function module:GetData()
    return self.Data
end
--提供修改数据的方法，只应该提供给服务器数据来时修改用。
function module:Refresh(data)
    self.Data = data
    self:SendNotification(PlayerInfoProxy.CMD_REFRESH)
end